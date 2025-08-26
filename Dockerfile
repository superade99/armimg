# Use ARM64 base (works with Graviton)
FROM --platform=linux/arm64 python:3.12-slim

WORKDIR /app

# Copy agent code
COPY . .

# Expose AgentCore Runtime default port
EXPOSE 8080
# Copies the trainer code to the docker image.
COPY trainer /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
