resource "aws_organizations_policy" "deny_s3_public" {
  name     = "DenyS3Public"
  content = file("${path.module}/deny_s3_public.json")
  type     = "SERVICE_CONTROL_POLICY"
}

data "aws_organizations_organizational_unit" "dev" {
  parent_id = var.root_id
  name      = "Dev" # замените на актуальное имя OU
}

resource "aws_organizations_policy_attachment" "attach_scp" {
  policy_id = aws_organizations_policy.deny_s3_public.id
  target_id = data.aws_organizations_organizational_unit.dev.id

  depends_on = [aws_organizations_policy.deny_s3_public]
}