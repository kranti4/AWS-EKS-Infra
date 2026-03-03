resource "aws_security_group" "rds_sg" {
  name        = "${var.project_name}-${terraform.workspace}-rds-sg"
  description = "Allow EKS nodes to access RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks     = [var.vpc_cidr] 
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${terraform.workspace}-db-subnet-group"
  subnet_ids = [for s in aws_subnet.private : s.id]
}

resource "aws_db_instance" "postgres" {
  identifier             = "${var.project_name}-${terraform.workspace}-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.4"
  instance_class         = var.db_instance_class
  db_name                = "appdb"
  username               = "dbadmin"
  password               = "ManagedBySecretsManager!" #Real password managed via AWS Secrets manager or CI/CD
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = terraform.workspace != "prod" # Keep snapshots for Prod only
}