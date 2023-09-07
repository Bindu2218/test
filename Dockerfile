FROM python:3.8-slim-buster
WORKDIR /usr/src/app
COPY requirements.txt /usr/src/app/
RUN python install
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "run.py"]
