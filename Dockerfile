FROM public.ecr.aws/docker/library/python:3.12-slim
WORKDIR /
RUN apt update && apt -y install curl git wget sudo ufw
# Copies the trainer code to the docker image.
COPY trainer /trainer
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "trainer.task"]
