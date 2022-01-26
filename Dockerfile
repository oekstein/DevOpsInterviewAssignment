FROM python:3.7-alpine

RUN python -m virtualenv venv

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY microservice .

CMD ["python", "microservice/main.py"]