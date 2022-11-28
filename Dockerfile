FROM python:alpine3.8
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install psycopg2-binary

ENV POSTGRES_DB='amazon'
ENV POSTGRES_USER='workshop_user'

ENV POSTGRES_PASSWORD='workshop_user1'

ENV POSTGRES_HOST='127.0.0.1'
ENV POSTGRES_PORT='5435'

COPY . /
WORKDIR /src/app
RUN pip install -r /requirements.txt
EXPOSE 5000
ENV ES_HOST='127.0.0.1'
ENV ES_PORT=9200
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
