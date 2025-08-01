FROM python:3.10-slim

# Install system dependencies including GDAL and git
RUN apt-get update && apt-get install -y \
    libgomp1 \
    libgeos-dev \
    libproj-dev \
    gdal-bin \
    libgdal-dev \
    gcc \
    g++ \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone the plateau2minecraft repository
RUN git clone https://github.com/Project-PLATEAU/plateau2minecraft.git . \
    && rm -rf .git

# Install poetry
RUN pip install poetry

# Install Python dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-root

# Create directories for input and output data
RUN mkdir -p ./data/input ./data/output/world_data/region

# Add src to PYTHONPATH
ENV PYTHONPATH="/app/src:${PYTHONPATH}"

# Copy conversion script
COPY convert-all.sh /app/convert-all.sh
RUN chmod +x /app/convert-all.sh

# Set the entrypoint
ENTRYPOINT ["python", "-m", "plateau2minecraft"]