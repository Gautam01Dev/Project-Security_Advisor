# Use a slim Python image for smaller size
FROM python:3.11-slim

# Set the DEBIAN_FRONTEND environment variable to suppress non-interactive warnings during apt installs
ARG DEBIAN_FRONTEND=noninteractive

# Set the main application directory
WORKDIR /app

# Install system dependencies:
# 1. gcc (Needed to compile psycopg2-binary, a PostgreSQL driver)
# 2. libpq-dev (Required runtime library for PostgreSQL client connections)
# 3. build-essential (Helpful set of tools often needed for compiling)
RUN apt-get update && \
    apt-get install -y gcc libpq-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements file and install Python dependencies
# This layer is cached well if dependencies don't change
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application source code
# Assuming your backend code is organized under a 'backend' directory
# If your code is flat (e.g., main.py at the top level), adjust this.
COPY backend/ ./backend/ 

# Set the final working directory where the entry point script is located.
# Since your FastAPI service is run from here, let's keep it simple:
# We run the application from the root /app to ensure all imports work correctly.
# If main.py is inside 'backend/', the uvicorn command needs to reflect that,
# or we move the core dependencies up. Let's assume the FastAPI entry point is at: backend.main
# If you place all files into the root:
# COPY . . 
# CMD ["uvicorn", "main:app", ...]

# Assuming your code structure means your FastAPI app is defined in 'backend/main.py'
# We must adjust the CMD to tell Python/Uvicorn the correct module path.

# Command to run the application (Adjusted to point to 'backend.main:app')
EXPOSE 8000
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]