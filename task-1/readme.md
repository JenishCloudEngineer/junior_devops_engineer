# Task 1 - Dockerized Flask Application with CI/CD

## Overview

This task demonstrates a simple Flask web application that has been containerized using Docker and integrated with GitHub Actions for Continuous Integration (CI).

The CI pipeline automatically installs dependencies, runs unit tests, builds the Docker image, and (optionally) pushes the image to Docker Hub whenever code is pushed to the `main` branch.

---

## Project Structure

```text
task-1/
├── app.py
├── requirements.txt
├── test_app.py
├── Dockerfile
├── .dockerignore
└── README.md
```

---

## Prerequisites

- Python 3.12+
- Docker
- Git
- GitHub Account

---

## Running the Application Locally

Install the required dependencies:

```bash
pip install -r requirements.txt
```

Start the application:

```bash
python app.py
```

Open your browser and navigate to:

```
http://localhost:5000
```

Expected output:

```
Hello, DevOps!
```

---

## Running the Tests

Execute the unit tests using pytest:

```bash
pytest
```

Expected result:

```
1 passed
```

---

## Building the Docker Image

Build the Docker image:

```bash
docker build -t flask-devops-app .
```

Run the container:

```bash
docker run -d --name flask-app -p 5000:5000 flask-devops-app
```

Verify the application:

```
http://localhost:5000
```

or

```bash
curl http://localhost:5000
```

---

## GitHub Actions CI Pipeline

The GitHub Actions workflow performs the following steps:

1. Checkout the repository
2. Set up Python
3. Install project dependencies
4. Execute unit tests using pytest
5. Build the Docker image
6. Push the Docker image to Docker Hub (Bonus)

The workflow is triggered on every push to the `main` branch.

---

## Docker Hub (Bonus)

The Docker image is pushed to Docker Hub using GitHub Secrets.

Required secrets:

- `DOCKERHUB_USERNAME`
- `DOCKERHUB_TOKEN`

---

## Files

| File | Description |
|------|-------------|
| app.py | Flask application |
| requirements.txt | Python dependencies |
| test_app.py | Unit tests |
| Dockerfile | Docker image configuration |
| .dockerignore | Excludes unnecessary files from Docker build |
| ci.yml | GitHub Actions CI/CD workflow |

---

## Outcome

Successfully implemented:

- Flask application
- Docker containerization
- Automated unit testing
- GitHub Actions CI pipeline
- Docker image build
- Docker Hub image publishing (Bonus)