resource "aws_security_group" "webserver-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = ""
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    
  ingress {
    description      = ""
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "webserver-sg"
  }
}



resource "aws_instance" "webserver" {
    
   ami  =  "ami-0af25d0df86db00c1"    
   instance_type = "t2.micro"
   key_name  = "mumbai-aws-new"
   vpc_security_group_ids  = [  aws_security_group.webserver-sg.id ]
   tags = {
     Name = "webserver",
     Project = "Zomato"
       
   }
}
