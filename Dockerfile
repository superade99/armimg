# Minimal Ubuntu base image
FROM public.ecr.aws/ubuntu/ubuntu:22.04

# Install common tools (wget, curl, etc.)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        ca-certificates \
        python3 \
        python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Copies the trainer code to the docker image.
COPY trainer /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
