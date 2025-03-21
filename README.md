# Terraform AWS Infrastructure Blueprint

## 📌 Project Description
This project uses **Terraform** to automatically deploy a **complete AWS infrastructure**, including:

✅ **ECS (Elastic Container Service)** – Cluster for managing containers  
✅ **EC2 (Elastic Compute Cloud)** – Virtual machines  
✅ **RDS (Relational Database Service)** – Database (PostgreSQL, MySQL)  
✅ **S3 (Simple Storage Service)** – Data storage  
✅ **IAM (Identity and Access Management)** – User and access management  
✅ **CloudWatch** – Monitoring and logging  
✅ **Route 53** – Domain and DNS management  
✅ **SES (Simple Email Service)** – AWS email service  
✅ **SNS (Simple Notification Service)** – Notification system  

## 🏗️ **Architecture**
This project creates a **fully connected AWS infrastructure** where:

- **ECS** connects to **RDS** and **S3**
- **EC2** and **ECS** use IAM for access control
- **Route 53** configures a domain for the Load Balancer
- **CloudWatch** monitors service metrics
- **SNS and SES** are used for notifications

## 📂 **Project Structure**
```plaintext
Terraform AWS Infrastructure Blueprint/
│── modules/
│   ├── backend/       # Modul S3 + DynamoDB
│   ├── ecs/           # ECS Module
│   ├── rds/           # RDS Module
│   ├── s3/            # S3 Module
│   ├── iam/           # IAM Module
│   ├── route53/       # Route 53 Module
│   ├── ses/           # SES Module
│   ├── sns/           # SNS Module
│   ├── cloudwatch/    # CloudWatch Module
│── main.tf            # Main Terraform file
│── variables.tf       # Terraform variables
│── terraform.tfvars   # Configuration variables
│── outputs.tf         # Terraform output variables
│── README.md          # This file
```

## 🚀 **How to Deploy the Infrastructure**
### **1️⃣ Install Terraform and AWS CLI**
Before running the deployment, ensure you have:
- [Terraform](https://www.terraform.io/downloads)
- [AWS CLI](https://aws.amazon.com/cli/)

Set up **AWS CLI**:
```sh
aws configure
```

### **2️⃣ Initialize Terraform**
```sh
terraform init
```

### **3️⃣ Run `terraform plan` to preview the changes**
```sh
terraform plan
```

### **4️⃣ Deploy the infrastructure**
```sh
terraform apply -auto-approve
```

### **5️⃣ Verify the deployment**
To display all created resources:
```sh
terraform output
```

## 🛑 **How to Destroy the Infrastructure**
To remove all AWS resources, run:
```sh
terraform destroy -auto-approve
```

---

## 🛠 **Additional Configuration**
### **Variables (`terraform.tfvars`)**
You can define configuration values in `terraform.tfvars`:
```hcl
aws_region     = "eu-central-1"
vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
ecs_instance_type = "t3.micro"
db_instance_type = "db.t3.micro"
db_username      = "tfadmin"
db_password      = "P@ssw0rd!"
s3_bucket_name   = "my-s3-bucket-terraform"
route53_domain   = "mydomain.com"
ses_domain       = "mydomain.com"
sns_topic_name   = "alerts-topic"
```

---

## 🏆 **You're all set!**
Now you have a **fully automated AWS infrastructure** using Terraform.  
