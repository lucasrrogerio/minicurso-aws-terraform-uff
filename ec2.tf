resource "aws_instance" "bastion_host" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  subnet_id              = aws_subnet.public_subnet_lab.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  key_name = aws_key_pair.my_key_pair.key_name

  tags = { Name = "bastion-host" }
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my_key_pair"
  public_key = file("keys/mykeypair.pub")
}

resource "aws_instance" "private_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  subnet_id              = aws_subnet.private_subnet_lab.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  key_name = aws_key_pair.my_key_pair.key_name

  tags = { Name = "private-instance" }
}
