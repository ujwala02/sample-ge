FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf


RUN apt update -y
RUN apt install python3 python3-pip -y


WORKDIR /ge
COPY ./requirements.txt /ge/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /ge/requirements.txt


COPY ./ge/app /ge/app

COPY my-entry.sh /ge/

CMD ["/ge/my-entry.sh"]

ENTRYPOINT ["tail", "-f", "/dev/null"]
