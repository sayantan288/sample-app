FROM python:3.8.10-buster

WORKDIR /usr/src
RUN apt-get update \
    && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/*


COPY setup.py .

RUN touch README.md
RUN mkdir scripts && touch scripts/ghcli


RUN python -m pip install -e ".[test]"

COPY . .
