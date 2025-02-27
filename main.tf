provider "aws" {
  region = "us-east-1"  # Change as needed
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows SSH from any IP (use specific IP for security)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami             = "ami-0c55b159cbfafe1f0"  # Amazon Linux AMI (update if needed)
  instance_type   = "t2.micro"
  key_name        = "terra"  # Your key pair name
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "Terraform-EC2"
  }
}

output "instance_ip" {
  value = aws_instance.web.public_ip
}
