# Task 1 - Dockerize a Simple Flask Application with CI/CD

## Objective

Create a simple Flask application, Dockerize it, write unit tests, and configure a GitHub Actions pipeline to automatically build and test the application.

## Project Structure

```
task-1/
├── app.py
├── requirements.txt
├── test_app.py
├── Dockerfile
├── .dockerignore
└── README.md
```

## Technologies Used

- Python 3
- Flask
- Pytest
- Docker
- GitHub Actions

## Application

The application exposes a single endpoint:

- **GET /** → Returns:

```
Hello, DevOps!
```

## Running Locally

Create a virtual environment:

```bash
python3 -m venv venv
source venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Run the application:

```bash
python app.py
```

Visit:

```
http://localhost:5000
```

## Running Tests

```bash
pytest
```

Expected output:

```
1 passed
```

## Docker

Build the Docker image:

```bash
docker build -t flask-devops-app .
```

Run the container:

```bash
docker run -d -p 5000:5000 flask-devops-app
```

Access:

```
http://localhost:5000
```

## CI/CD Pipeline

GitHub Actions automatically performs the following on every push to the **main** branch:

1. Checkout source code
2. Install Python dependencies
3. Execute unit tests
4. Build Docker image
5. Push Docker image to Docker Hub (optional)

## Outcome

The Flask application was successfully containerized, tested using Pytest, and automated with a GitHub Actions CI pipeline.