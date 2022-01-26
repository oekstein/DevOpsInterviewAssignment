FROM python:3.7-alpine

COPY requirements.txt .

RUN apk update
RUN apk add install gcc

RUN pip install -r requirements.txt

RUN python -m virtualenv venv

COPY microservice .

CMD ["python", "microservice/main.py"]