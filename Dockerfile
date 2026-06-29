FROM python:3.11-alpine

LABEL maintainer="Marimuthu"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /opt/grafana-backup-tool

# Install system dependencies
RUN apk add --no-cache \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    git

# Copy source
COPY . .

# Install Python package
RUN pip install --no-cache-dir --break-system-packages .

# Create output directory
RUN mkdir -p /opt/grafana-backup-tool/_OUTPUT_

ENTRYPOINT ["grafana-backup"]

CMD ["save"]
