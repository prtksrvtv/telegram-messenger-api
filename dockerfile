# syntax=docker/dockerfile:1

FROM python:3.9-slim-buster

WORKDIR /telegram-messenger

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD ["gunicorn", "-w 4", "-b", "0.0.0.0:8000", "telegram_messenger:app"]
