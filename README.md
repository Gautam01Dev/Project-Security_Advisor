# AI Cloud Security Advisor - Project Skeleton (Docker-ready)

This archive contains a runnable skeleton for the AI Cloud Security Advisor project (backend + infra),
based on your requested stack: FastAPI, PostgreSQL, Redis, Celery, OpenAI, AWS & Azure SDKs, Prometheus.

## What's included
- backend/ (FastAPI minimal implementation)
- Dockerfile
- docker-compose.yml (Postgres, Redis, Prometheus, Grafana)
- requirements.txt
- prometheus.yml
- .env.sample

## How to run (Docker Compose)
1. Copy `.env.sample` to `.env` and fill secrets (OPENAI_API_KEY, JWT_SECRET, etc.)
2. Build and run:
   ```bash
   docker-compose up --build
   ```
3. API will be available at `http://localhost:8000`

## Notes
- This is a starter skeleton. The real scanners, AI integration, and Celery tasks are included as stubs for you to extend.
- If you want, I can now generate the full detailed implementation files (aws_scanner, azure_scanner, ai_engine, celery tasks) inside the backend folder.