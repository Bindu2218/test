# FROM python:3.8-slim-buster
# WORKDIR /usr/src/app
# COPY requirements.txt /usr/src/app/
# RUN python -m pip install --upgrade pip
# RUN pip install -r requirements.txt
# EXPOSE 5000
# CMD ["python", "run.py"]
FROM python:3.8-slim-buster
USER root
WORKDIR /usr/local/app
COPY requirements.txt /usr/local/app/requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
CMD ["gunicorn", "--bind=0.0.0.0", "--timeout.","600","run:app"]


