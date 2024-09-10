# Use a minimal Ubuntu base image (slim)
FROM ubuntu:22.04 as base

# Set environment variables to avoid user interaction during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Step 1: Update and install necessary utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    git \
    python3 \
    python3-pip \
    python3-venv \
    build-essential

# Step 2: Install Dart without apt-key (modern approach)
RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/dart-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/dart-archive-keyring.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" | tee /etc/apt/sources.list.d/dart_stable.list > /dev/null && \
    apt-get update && \
    apt-get install -y --no-install-recommends dart

# Step 3: Install Python Jupyter and Lab
RUN pip3 install --no-cache-dir notebook jupyterlab setuptools jupyterdartkernel

# Step 4: Clone the Dart Jupyter kernel repository and install it system-wide
RUN git clone https://github.com/vickumar1981/jupyter-dart-kernel.git /opt/jupyter-dart-kernel && \
    cd /opt/jupyter-dart-kernel && \
    pip install . && \
    jupyter kernelspec install /opt/jupyter-dart-kernel

# Step 5: Clean up unnecessary packages to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Step 6: Set default python and dart commands to be executable from any shell session
RUN ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/dart /usr/local/bin/dart

# Step 7: Verify installation
RUN python --version && pip --version && dart --version

# Set the working directory
WORKDIR /workspace