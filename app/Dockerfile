# Demo image. Nothing secret is copied into the image.
FROM python:3.12-slim

WORKDIR /app
COPY main.py .

EXPOSE 8080

# The image does not need root to serve HTTP.
USER nobody

CMD ["python", "main.py"]
