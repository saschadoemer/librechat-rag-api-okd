
# Use the image directly from Docker Hub (adjust username/repo as needed)
FROM ghcr.io/danny-avila/librechat-rag-api-dev:latest

# Set default UID/GID (can be overridden at build time)
ARG USER_UID=1001
ARG USER_GID=1001

# Create non-root user with configurable UID/GID
RUN groupadd -r -g ${USER_GID} raguser && useradd -r -u ${USER_UID} -g raguser raguser && \
    chown -R raguser:raguser /app && \
    chown -R raguser:raguser /nltk_data

# Switch to non-root user
USER raguser

WORKDIR /app

CMD ["python", "main.py"]