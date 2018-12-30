#!/bin/bash
RUN=$1
IMAGE=$(docker image ls | grep -q my_python; echo $?)
if [[ $RUN == "bash" ]]; then
    if [[ $IMAGE -ne 0 ]]; then
      docker image build -t my_python:latest . && \
      docker container run --rm -it --name python --hostname python -v $(pwd)/volume:/opt/app-root/src/persistant my_python:latest /bin/bash \
      || echo "Failed !"; exit 1
    else
      docker container run --rm -it --name python --hostname python -v $(pwd)/volume:/opt/app-root/src/persistant my_python:latest /bin/bash
    fi

else
    if [[ $IMAGE -ne 0 ]]; then
      docker image build -t my_python:latest . && \
      docker container run --rm -it --name python --hostname python -v $(pwd)/volume:/opt/app-root/src/persistant my_python:latest \
          /opt/app-root/bin/python || echo "Failed !"; exit 1
    else
      docker container run --rm -it --name python --hostname python -v $(pwd)/volume:/opt/app-root/src/persistant my_python:latest /opt/app-root/bin/python
    fi
fi
