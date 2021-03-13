data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id 
  instance_type = "t2.micro"
  key_name      = "aws-devops"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]

  user_data   = templatefile("user_data.tmpl", { department = var.user_department, name = var.user_name })
}
