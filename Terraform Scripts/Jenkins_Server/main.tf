resource "aws_instance" "JenkinsServer" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.my_instance_type
  key_name               = var.my_key
  vpc_security_group_ids = [aws_security_group.web-traffic.id]

  tags = {
    "Name" = "Jenkins-Server"
  }
}

output "name" {
  # display public ip of Jenkins Server
  value = aws_instance.JenkinsServer.public_ip
  
}