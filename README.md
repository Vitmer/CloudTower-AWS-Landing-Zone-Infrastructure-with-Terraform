
# 🌐 Terraform AWS Landing Zone (Enterprise-Grade)

## 📌 Description

This project is a fully modular, production-grade **AWS Landing Zone** built using **Terraform**. It mirrors the architecture of **AWS Control Tower**, but offers complete flexibility and customization. It is designed to support multi-account governance, centralized security, cost monitoring, and scalable workloads.

---

## 🧱 Architecture

### 🔹 Core Modules:

| Module           | Purpose                                           |
|------------------|---------------------------------------------------|
| `backend`        | Terraform state management (S3 + DynamoDB)        |
| `vpc`            | Core networking, subnets, IGW/NAT                 |
| `ecs`            | ECS Cluster, Task Definition, ALB                 |
| `rds`            | PostgreSQL database in private subnets            |
| `s3`             | Object storage                                    |
| `iam`            | IAM roles and permissions                         |
| `logging`        | CloudTrail to S3 and CloudWatch                   |
| `cloudwatch`     | ECS monitoring and log groups                     |
| `security`       | GuardDuty, Security Hub, AWS Config               |
| `organizations`  | AWS Organizations, Organizational Units           |
| `policies`       | SCP enforcement for account governance            |
| `route53`        | DNS zones and records                             |
| `ses`            | Email verification and sending                    |
| `sns`            | Event notifications (Budget, CloudWatch)          |
| `billing`        | Budget alerts with SNS/email                      |

---

## 🔐 Security & Monitoring

- ✅ Organization-wide `CloudTrail` with multi-region support
- ✅ `AWS Config` enabled and recording
- ✅ Centralized `GuardDuty` and `Security Hub`
- ✅ Least-privilege IAM roles with execution policies
- ✅ SCPs applied to OU for strict account-level control

---

## ☁️ Multi-Account Design

- AWS Organizations with `Dev` Organizational Unit
- Separate `DevAccount` with custom role
- SCPs enforced to block risky behavior
- Ready to extend to `Prod`, `Security`, `Audit` accounts

---

## 📡 Notifications

- Cost alerting via `aws_budgets_budget`
- Email alerts via `SNS` and `SES`
- Ready for CloudWatch Alarms + Lambda trigger

---

## 🧪 CI/CD (Recommended)

- GitHub Actions: `terraform init`, `plan`, `apply`
- Lint: `tflint`, `tfsec`
- `terraform fmt` + `pre-commit` hooks
- Container image deploy via `aws ecs update-service`

---

## 🔧 Requirements

- Terraform ≥ 1.3.0
- AWS CLI with credentials
- Variables defined via `terraform.tfvars` or `variables.tf`

---

## 🗂️ Project Structure

```
.
├── backend/
├── billing/
├── cloudwatch/
├── ecs/
├── iam/
├── logging/
├── organizations/
├── policies/
├── rds/
├── route53/
├── s3/
├── security/
├── ses/
├── sns/
├── vpc/
└── main.tf
```

---

## 🏁 Getting Started

```bash
terraform init
terraform plan
terraform apply
```

---

## 📃 License

MIT License. Free to use, extend, and deploy in production.
