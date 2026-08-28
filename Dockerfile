# Headless Email OAuth 2.0 Proxy for ByteLord (spamnet).
# Core deps only; always run with --no-gui.
FROM python:3.12-slim-bookworm

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && (getent group 1001 >/dev/null || groupadd --gid 1001 proxyuser) \
    && (getent passwd 1001 >/dev/null || useradd --system --uid 1001 --gid 1001 --home-dir /app --no-create-home proxyuser)

COPY requirements-core.txt .
RUN pip install -r requirements-core.txt

COPY emailproxy.py .

# Config + token cache are bind-mounted (see deploy/bytelord-compose.yaml).
RUN mkdir -p /config /cache \
    && chown -R 1001:1001 /app /config /cache

USER 1001:1001

EXPOSE 1993

ENTRYPOINT ["python", "-u", "emailproxy.py", \
    "--no-gui", \
    "--config-file", "/config/emailproxy.config", \
    "--cache-store", "/cache/tokenstore.config", \
    "--log-file", "/cache/emailproxy.log"]
