FROM ubuntu:22.04

# Install necessary packages, including the Python development headers
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip python3.12 python3.12-dev libssl-dev build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files to the app directory
COPY . /app/

# Set the working directory to /app
WORKDIR /app/

# Install Python dependencies from the requirements file
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

# Set the command to run your main.py script
CMD ["python3", "main.py"]
