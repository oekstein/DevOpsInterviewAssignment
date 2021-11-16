FROM python:3.7-alpine
COPY requirments.txt
RUN python -m virtualenv venv
