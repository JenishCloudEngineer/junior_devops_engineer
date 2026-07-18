# Task 3 - Infrastructure as Code using Terraform

## Objective

Provision AWS infrastructure using Terraform.

## Resources Created

- Amazon EC2 Instance
- Amazon S3 Bucket
- S3 Public Access Block
- Security Group

## Files

```
task-3/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── plan_output.txt
├── .gitignore
└── README.md
```

## Variables

The following values are parameterized using `variables.tf`:

- AWS Region
- EC2 Instance Type
- Public IP Address (SSH Access)

No values are hardcoded in `main.tf`.

## Resources

### Amazon S3 Bucket

- Public access blocked
- Unique bucket name generated using Terraform Random Provider

### Security Group

Ingress Rules:

| Port | Protocol | Source |
|------|----------|---------|
|22|TCP|My Public IP|
|80|TCP|0.0.0.0/0|

Egress:

- Allow all outbound traffic

### EC2 Instance

- Amazon Linux 2023 AMI
- Instance Type using variable
- Attached to the created Security Group

## Outputs

Terraform outputs:

- EC2 Public IP
- S3 Bucket Name

## Terraform Commands

Initialize:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Format:

```bash
terraform fmt
```

Create execution plan:

```bash
terraform plan -out=tfplan
```

Generate plan output:

```bash
terraform show tfplan > plan_output.txt
```

Deploy:

```bash
terraform apply
```

Destroy Resources:

```bash
terraform destroy
```

## Resource Overview

### Amazon S3 Bucket
The S3 bucket provides scalable object storage. In this project, public access is blocked to ensure the bucket remains private and secure by default.

### S3 Public Access Block
This resource prevents public access to the S3 bucket by blocking public ACLs and bucket policies, helping protect stored data from accidental exposure.

### Security Group
The Security Group acts as a virtual firewall for the EC2 instance. It allows:
- SSH (Port 22) only from my current public IP address for secure remote administration.
- HTTP (Port 80) from anywhere (0.0.0.0/0) so the web application can be accessed publicly.
- All outbound traffic to allow the instance to communicate with AWS services and the internet.

### Amazon EC2 Instance
The EC2 instance provides the virtual server used to run the application. It uses the Amazon Linux 2023 AMI and is associated with the created Security Group.


## Why `.tfstate` is Ignored

Terraform state files contain the current infrastructure state and may include sensitive information such as resource identifiers, IP addresses, and other infrastructure metadata. They should not be committed to source control. In production environments, Terraform state should be stored securely using a remote backend (for example, an S3 bucket with state locking).

## Outcome

Terraform successfully provisioned:

- Amazon EC2 Instance
- Amazon S3 Bucket
- Public Access Block Configuration
- Security Group

The required outputs and execution plan were generated successfully.