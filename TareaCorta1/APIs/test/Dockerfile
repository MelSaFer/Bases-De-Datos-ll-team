FROM python:3.9

WORKDIR /app

COPY app/. .
RUN pip install --no-cache-dir -r requirements.txt
# RUN ls
# RUN python test_mariadb.py

CMD [ "python", "-u", "./test.py" ] 