FROM python:3.9

ARG APP_PORT

COPY ./ ./
RUN pip install -r requirements.txt

ENV PORT=$APP_PORT

CMD ["sh", "-c", "python manage.py collectstatic --noinput && python manage.py migrate && gunicorn mysite.wsgi:application --bind 0.0.0.0:$PORT"]
