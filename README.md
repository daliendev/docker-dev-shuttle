# Docker Development Environment

This repository provides a Docker-based development environment setup. It includes essential development tools and configurations to streamline the development process.

## Purpose

The purpose of this codebase is to create a consistent and reproducible development environment using Docker.

## Features

- **Ubuntu Base Image**: Uses the latest Ubuntu image as the base.
- **Development Tools**: Installs common development tools such as `curl`, `git`, `nvm`, `nodejs`, `npm`, `php`, and various PHP extensions.

## Setup Instructions

### Prerequisites

- Docker installed on your machine.

### Building the Docker Image

1. Clone this repository:
   ```bash
   git clone https://github.com/daliendev/docker-dev-shuttle/
   cd docker-dev-shuttle
   ```

2. Build the Docker image:
   ```bash
   docker build -t dev-shuttle .
   ```

### Running the Docker Container

1. Run a container from the built image:
   ```bash
   docker run -it dev-shuttle
   ```

This will start a new container with the development environment set up as specified in the `Dockerfile`.

## License

This project is licensed under the MIT License.
