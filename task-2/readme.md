# Task 2 - Deploy Dockerized Application to AWS EC2

## Objective

Deploy the Dockerized Flask application to an Amazon EC2 instance and make it accessible over HTTP.

## AWS Resources

- Amazon EC2
- Security Group
- Docker Engine

## IAM Permissions

The deployment was performed using an AWS IAM user/role with permissions required to launch and manage EC2 resources and configure Security Groups. Administrative access was used only for the purpose of this assessment.

### Why Least Privilege Matters

The principle of least privilege ensures that users and applications are granted only the permissions necessary to perform their required tasks. Restricting permissions reduces the risk of accidental changes, unauthorized access, and potential security breaches.

For this deployment:
- SSH access (Port 22) was restricted to my current public IP address.
- HTTP access (Port 80) was opened to the public so the Flask application could be accessed.
- Only the required AWS resources were created for the deployment.

## EC2 Configuration

Instance Type:

```
t2.micro / t3.micro
```

Security Group Rules:

| Port | Protocol | Source | Purpose |
|------|----------|---------|----------|
|22|TCP|My Public IP|SSH|
|80|TCP|0.0.0.0/0|HTTP|

## Install Docker

```bash
sudo yum update -y
sudo yum install docker -y

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker ec2-user
```

Reconnect via SSH.

## Pull Docker Image

```bash
docker pull <dockerhub-username>/flask-devops-app:latest
```

## Run Container

```bash
docker run -d \
--name flask-app \
-p 80:5000 \
<dockerhub-username>/flask-devops-app:latest
```

## Verify Deployment

Open:

```
http://<EC2-Public-IP>
```

The application displays:

```
Hello, DevOps!
```

## CloudWatch (Optional)

A CloudWatch CPU Utilization Alarm was created to monitor the EC2 instance.

## Outcome

The Dockerized Flask application was successfully deployed on an Amazon EC2 instance and verified through its public IP address.