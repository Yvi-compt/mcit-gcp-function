#FROM python:3.9
#WORKDIR /app
#COPY . /app
#RUN pip install -r requirements.txt
#CMD ["gunicorn", "-b", "0.0.0.0:8080", "main:app"]

FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8080
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
