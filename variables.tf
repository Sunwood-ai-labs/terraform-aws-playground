# variables.tf
# このファイルは、Terraformプロジェクトで使用される変数の定義を含みます。
# 各変数にはデフォルト値が設定されていますが、terraform.tfvarsファイルで上書きすることができます。

variable "aws_region" {
  description = "使用するAWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "プロジェクト名（リソースの命名に使用）"
  type        = string
  default     = "streamlit-app"
}

variable "vpc_cidr" {
  description = "VPCのCIDRブロック"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "パブリックサブネットのCIDRブロック"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ami_id" {
  description = "使用するAMIのID"
  type        = string
  default     = "ami-0d52744d6551d851e"  # Ubuntu 20.04 LTS (ap-northeast-1)
}

variable "instance_type" {
  description = "EC2インスタンスタイプ"
  type        = string
  default     = "t2.micro"
}
