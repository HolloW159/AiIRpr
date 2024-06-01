FROM python:3.10-slim

COPY ./requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /app

COPY ./inventory_project .

RUN mkdir -p inventory/history/reports

RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]