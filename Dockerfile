# Use ARM64 base (works with Graviton)
FROM --platform=linux/arm64 python:3.12-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy agent code
COPY . .

# Expose AgentCore Runtime default port
EXPOSE 8080

# Start the agent
CMD ["python", "my_agent.py"]
