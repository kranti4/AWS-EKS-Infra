resource "aws_secretsmanager_secret" "app_secrets" {
  name        = "${var.project_name}-${terraform.workspace}-app-credentials"
  description = "Application secrets for ${terraform.workspace} environment"
}

resource "aws_secretsmanager_secret_version" "app_secrets_initial" {
  secret_id     = aws_secretsmanager_secret.app_secrets.id
  secret_string = jsonencode({
    DB_USERNAME = aws_db_instance.postgres.username
    DB_HOST     = aws_db_instance.postgres.endpoint
  })
}