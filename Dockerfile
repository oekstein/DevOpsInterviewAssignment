FROM python:3.7-alpine

RUN apk update && apk add make build-base py3-virtualenv

COPY requirements.txt .

ENV VIRTUAL_ENV=./venv
RUN python3 -m virtualenv venv
ENV PATH=”$VIRTUAL_ENV/bin:$PATH”

RUN pip3 install -r requirements.txt

COPY . .

CMD ["python3", "microservice/main.py"]