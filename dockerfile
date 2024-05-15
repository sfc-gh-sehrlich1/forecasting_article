ARG BASE_IMAGE=python:3.11
FROM $BASE_IMAGE
RUN apt-get update && \
    apt-get install -y python3-pip

WORKDIR /usr/app
COPY . /usr/app   
RUN pip install -r requirements.txt
EXPOSE 8888   

#launch jupyter notebook server. NOTE!  ENTRYPOINT ( or CMD )intrscutions run each time a container is launched!
ENTRYPOINT ["jupyter", "lab","--allow-root","--ip=0.0.0.0","--port=8888","--no-browser" , "--NotebookApp.token=''", "--NotebookApp.password=''"] 