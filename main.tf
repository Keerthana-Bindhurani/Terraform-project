provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

resource "aws_instance" "app_server" {
  ami           = "ami-05b10e08d247fb927"  # Amazon Linux 2 AMI (Replace if needed)
  instance_type = "t2.micro"

  tags = {
    Name = "AppServer"
  }
}
