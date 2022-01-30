FROM python:3.7-alpine

RUN apk update && apk add make build-base

COPY requirements.txt .

RUN pip3 install virtualenv

RUN python3 -m virtualenv venv

RUN pip3 install -r requirements.txt

COPY . .

CMD ["python3", "microservice/main.py"]