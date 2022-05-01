FROM python:3.7-slim-buster

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

#RUN apt-get update \
#&& apt-get install gcc -y \
#&& apt-get clean

WORKDIR /code

COPY . /code

RUN chmod +x /code/app/train.py
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

###ENTRYPOINT ["python"]

CMD ["uvicorn", "app.main:app", "--reload", "--proxy-headers", "--host", "0.0.0.0", "--port", "8005"]
