# FROM python:3.8-slim-buster
# WORKDIR /usr/src/app
# COPY requirements.txt /usr/src/app/
# RUN python -m pip install --upgrade pip
# RUN pip install -r requirements.txt
# EXPOSE 5000
# CMD ["python", "run.py"]
FROM python:3.9.13-slim-bullseye
USER root
WORKDIR /usr/local/app
COPY requirements.txt /usr/local/app
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install gunicorn
# CMD ["gunicorn", "--bind=0.0.0.0", "--timeout=600","run:app"]
CMD ["python", "app.py"]


