FROM python:3.13-slim

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ .

ENV PORT=8000
ENV GREETING="Hello, Docker!"
ENV STORAGE=sqlite
ENV DATA_FILE=/data/counter.db

EXPOSE 8000

CMD ["python", "-u", "app.py"]

