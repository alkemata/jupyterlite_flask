# Dockerfile
FROM python:3.9-slim

WORKDIR /jupyterlite

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js and npm (needed for JupyterLab extensions)
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

# Install JupyterLab extension development tools
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install --no-cache-dir jupyter-packaging jupyterlab-git
RUN pipx install copier


RUN jupyter lite build 
CMD jupyter lite serve