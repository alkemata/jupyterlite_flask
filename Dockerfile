# Dockerfile
FROM python:3.9-slim

WORKDIR /jupyterlite

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
CMD jupyter lite init