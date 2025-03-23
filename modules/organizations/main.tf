data "aws_organizations_organization" "main" {}

resource "aws_organizations_organizational_unit" "dev" {
  name      = "Dev"
  parent_id = data.aws_organizations_organization.main.roots[0].id
}

resource "aws_organizations_account" "dev_account" {
  name      = "DevAccount"
  email     = "dev@mycompany.com"
  role_name = "OrganizationAccountAccessRole"
  parent_id = aws_organizations_organizational_unit.dev.id
}