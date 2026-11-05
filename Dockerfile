FROM python:3.12-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Settings come from the environment at run time:
#   docker run --rm -v "$PWD/data:/app/data" music-chart-tracker          (Apple Music chart, CSV history)
#   docker run --rm -e STORAGE=mysql -e DB_HOST=... music-chart-tracker   (MySQL storage)
ENTRYPOINT ["python", "main.py"]
CMD ["fetch"]
