# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV NVM_DIR="/home/developer/.nvm"

# Create a non-root user and add to sudo group
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install common development tools and clean up
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    openssh-client \
    curl \
    git \
    build-essential \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PHP from the official repository
RUN add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
    php \
    php-cli \
    php-mbstring \
    php-xml \
    php-curl \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch to non-root user
USER developer
WORKDIR /home/developer

# Install nvm and the latest Node.js
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && \
    . "$NVM_DIR/nvm.sh" && \
    nvm install node && \
    nvm use node && \
    nvm alias default node

# Set up nvm environment variables
ENV PATH "$NVM_DIR/versions/node/$(nvm version)/bin:$PATH"

# Default command
CMD ["bash"]
