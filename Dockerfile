# syntax=docker/dockerfile:1

FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on

WORKDIR /app

COPY pyproject.toml README.md ./
COPY app app
COPY tests tests
COPY .env.example .env.example

RUN python -m pip install --upgrade pip \
    && python -m pip install -e '.[dev]'

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
