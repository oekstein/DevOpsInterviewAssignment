FROM python:3.7-alpine

RUN apk update && apk add make build-base

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN python -m virtualenv venv

COPY . .

CMD ["python3", "microservice/main.py"]