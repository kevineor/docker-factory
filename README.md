# ⚙️ Experimental Docker Factory

Experimental build system using Docker Buildx Bake to build images and Terraform to push them to a container registry.

## 🛠 Prerequisites

Make sure you have the following installed on your machine:
- Docker (with Buildx enabled)
- Docker Compose
- Terraform (>= 1.5)

## 🚀 Getting Started

### 1️⃣ Clone the repository

```bash
git clone https://github.com/kevineor/docker-factory.git
cd docker-factory
```

### 2️⃣ Start the local environment

```bash
docker-compose up -d
```

### 3️⃣ Run the build process

```bash
./run-build.sh
```

This script will:
- ✅ Execute Docker Buildx Bake to build images.
- ✅ Use Terraform to push the images to the configured registry.


Feel free to experiment, you can check the registry and see the images being pushed on http://localhost/
