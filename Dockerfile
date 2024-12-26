# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Create a non-root user
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install common development tools and clean up
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    openssh-client \
    curl \
    git \
    nodejs \
    npm \
    php \
    php-cli \
    php-mbstring \
    php-xml \
    php-curl \
    build-essential \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch to non-root user
USER developer
WORKDIR /home/developer

CMD ["bash"]
