FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update \
	&& apt-get install -y --no-install-recommends build-essential \
	&& rm -rf /var/lib/apt/lists/*

# Copy dependency manifest first to leverage Docker cache
COPY pyproject.toml /app/

# Install runtime dependencies listed in pyproject (pinned versions used to match file)
RUN pip install --no-cache-dir \
	"fastapi>=0.128.8" \
	"pydantic>=2.12.5" \
	"streamlit>=1.50.0" \
	"uvicorn>=0.39.0"

# Copy application source
COPY . /app

# Expose both common ports: FastAPI (8000) and Streamlit (8501)
EXPOSE 8000 8501

# APP_MODE selects which server to run: "api" or "streamlit". Default: api
ENV APP_MODE=api

CMD ["sh", "-c", "if [ \"$APP_MODE\" = \"streamlit\" ]; then streamlit run main.py --server.port 8501 --server.address 0.0.0.0; else uvicorn app:app --host 0.0.0.0 --port 8000; fi"]
