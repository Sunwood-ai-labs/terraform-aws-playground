# Main Terraform configuration file

provider "aws" {
  region = "us-west-2"  # お好みのリージョンに変更可能
}

# Example resource: EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"

  tags = {
    Name = "Example Instance"
  }
}
