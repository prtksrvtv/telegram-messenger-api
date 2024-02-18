FROM python:3.8-slim-buster

WORKDIR /telegram-messenger

COPY requirements.txt /
RUN pip install --no-cache-dir --upgrade -r /requirements.txt

COPY . .

EXPOSE 5000

#CMD [ "flask", "run","--host","0.0.0.0","--port","5000"]

CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000"]