FROM python:3.12-slim

# Install system dependencies
RUN apt-get update -y && apt-get install -y --no-install-recommends \
       gcc \
       libffi-dev \
       libssl-dev \
       build-essential \
       ffmpeg \
       aria2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app/

# Copy your application files
COPY . .

# Upgrade pip and install requirements
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir --requirement requirements.txt

# Command to run your application
CMD ["python3", "main.py"]  # Ensure this is your intended entry point
