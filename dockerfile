# syntax=docker/dockerfile:1

FROM python:3.9-slim-buster

WORKDIR /telegram-messenger

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 5000

ENV FLASK_APP = telegram_messenger.py

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
