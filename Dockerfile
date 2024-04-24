# catches
FROM anibali/pytorch:2.0.1-nocuda

WORKDIR /app

RUN sudo apt-get update && sudo apt-get install -y \
    git \
    && sudo rm -rf /var/lib/apt/lists/*

# get the really big model done with
RUN pip install transformers[torch]

# rest of the dependencies
COPY ["requirements.txt", "./"]
RUN pip install -r requirements.txt

# the code
COPY . .

USER root
CMD [ "python3", "main.py" ]

EXPOSE 6000

ENV HF_HOME=/modelcache
VOLUME [ "/modelcache" ]
# catches
