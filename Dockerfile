FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN apt update && apt install -y vim nano curl wget -y
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

RUN chmod -R 777 /app

# Create a non-root user to run the application
RUN useradd -m appuser
USER appuser

EXPOSE 8080

# Set Python to run unbuffered
ENV PYTHONUNBUFFERED=1