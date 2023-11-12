# create security group for the ec2 instance connect endpoint
resource "aws_security_group" "eice_security_group" {
  name        = "${var.project_name}-${var.environment}-eice-sg"
  description = "enable outbound traffic on port 22 from the vpc cidr"
  vpc_id      = aws_vpc.vpc.id


  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-eice-sg"
  }
}

# create security group for the application load balancer
resource "aws_security_group" "alb_security_group" {
  name        ="${var.project_name}-${var.environment}-alb-sg" 
  description = "enable http/https access on port 80/443"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-alb-sg" 
  }
}

# create security group for the app server
resource "aws_security_group" "app_server_security_group" {
  name        = "${var.project_name}-${var.environment}-webserver-sg" 
  description = "enable http/https access on port 80/443 via alb sg and ssh via eice sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "http access"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description     = "https access"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description     = "ssh access"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.eice_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    =-1 
    cidr_blocks =  ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-webserver-sg"
  }
}

# create security group for the database
resource "aws_security_group" "database_security_group" {
  name        = "${var.project_name}-${var.environment}-database-sg"
  description = "enable mysql/aurora on port 3360 via webserver-sg"
  vpc_id      = aws_vpc.vpc.id


  ingress {
    description     = "mysql/aurora access"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_server_security_group.id]
  }

  egress {
    from_port   = 0
    to_port     =0 
    protocol    =-1 
    cidr_blocks =["0.0.0.0/0"]
  } 
  

  tags = {
    Name = "${var.project_name}-${var.environment}-database-sg"
}
}