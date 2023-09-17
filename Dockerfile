FROM python:3.11

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install -y bash vim nano postgresql-client
RUN pip install --upgrade pip

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /app

RUN chmod +x /app/entrypoint.sh
RUN chmod +x /app/createsuperuser.sh

EXPOSE 8000

ENTRYPOINT ["/app/entrypoint.sh"]