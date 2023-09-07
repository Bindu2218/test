FROM python:3.8-slim-buster
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app/
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "run.py"]
