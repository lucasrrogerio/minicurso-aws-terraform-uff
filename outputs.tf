output "public_instance_ip" {
  value = aws_instance.bastion_host.public_ip
}

output "private_instance_ip" {
  value = aws_instance.private_instance.private_dns
}

output "ssh_command" {
  value = "ssh -i './keys/mykeypair' ubuntu@${aws_instance.bastion_host.public_ip}"
}

output "keypair_transfer_command" {
  value = "scp -i './keys/mykeypair' ./keys/mykeypair ubuntu@${aws_instance.bastion_host.public_ip}:~/"
}
