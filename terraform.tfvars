# terraform.tfvars
# このファイルには、プロジェクト固有の変数値が含まれています。
# main.tfとvariables.tfで定義された変数の値をここで設定します。

aws_region = "ap-northeast-1"
project_name = "streamlit-app"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
ami_id = "ami-0d52744d6551d851e"  # Ubuntu 20.04 LTS (ap-northeast-1)
instance_type = "t2.micro"
