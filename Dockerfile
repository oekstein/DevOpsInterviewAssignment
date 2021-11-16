FROM python:3.7-alpine
COPY requirements.txt
RUN python -m virtualenv venv
