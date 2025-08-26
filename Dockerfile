# Use ARM64 base (works with Graviton)
FROM --platform=linux/arm64 python:3.12-slim

RUN apt update && apt -y install curl git wget sudo ufw
# Copies the trainer code to the docker image.
COPY trainer /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
