# main.tf
# このファイルは、AWSリソースの定義とTerraformの設定を含むメインのファイルです。
# VPC、サブネット、セキュリティグループ、EC2インスタンス、IAMロールなどのリソースが定義されています。

# AWSプロバイダーの設定
provider "aws" {
  region = var.aws_region
}

# VPCの作成
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# パブリックサブネットの作成
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-public-subnet"
  }
}

# インターネットゲートウェイの作成
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# パブリックルートテーブルの作成
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

# パブリックサブネットとルートテーブルの関連付け
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# セキュリティグループの作成
resource "aws_security_group" "streamlit" {
  name        = "${var.project_name}-streamlit-sg"
  description = "Security group for Streamlit app"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 8501
    to_port     = 8501
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-streamlit-sg"
  }
}

# IAMロールの作成
resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# IAMロールにAmazonSSMManagedInstanceCoreポリシーをアタッチ
resource "aws_iam_role_policy_attachment" "ssm_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.ec2_role.name
}

# EC2インスタンスプロファイルの作成
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

# EC2インスタンスの作成
resource "aws_instance" "streamlit" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.streamlit.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y python3-pip
              pip3 install streamlit
              echo "import streamlit as st

              st.title('Hello, Streamlit on AWS EC2!')
              st.write('This is a simple Streamlit app running on an EC2 instance.')" > app.py
              nohup streamlit run app.py --server.port 8501 --server.address 0.0.0.0 &
              EOF

  tags = {
    Name = "${var.project_name}-streamlit-instance"
  }
}

# Elastic IPの割り当て
resource "aws_eip" "streamlit" {
  instance = aws_instance.streamlit.id
  domain   = "vpc"

  tags = {
    Name = "${var.project_name}-streamlit-eip"
  }
}

# 出力の定義
output "instance_id" {
  description = "EC2インスタンスID"
  value       = aws_instance.streamlit.id
}

output "public_ip" {
  description = "StreamlitアプリのパブリックIP"
  value       = aws_eip.streamlit.public_ip
}

output "streamlit_url" {
  description = "StreamlitアプリのURL"
  value       = "http://${aws_eip.streamlit.public_ip}:8501"
}
