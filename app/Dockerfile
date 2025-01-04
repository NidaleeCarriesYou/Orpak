# Stage 1: Build stage
FROM python:3.9-slim AS builder

WORKDIR /app

# Copy the dependencies and install them
COPY requirements.txt .  
RUN pip install --prefix=/install -r requirements.txt  

# Copy the application code
COPY app.py .  

# Stage 2: Production stage
FROM python:3.9-slim  

WORKDIR /app

# Copy dependencies from the build stage
COPY --from=builder /install /usr/local 
COPY app.py .  

# Security: Run as a non-root user
RUN addgroup --system appgroup && adduser --system --group appuser
USER appuser

EXPOSE 5000  

# Command to run the app
CMD ["python", "app.py"]
