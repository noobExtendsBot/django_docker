# BASE IMAGE
FROM python:3.7.5

# SET WORKDIR
RUN mkdir /app
WORKDIR /app

# ADD CURRENT CODE TO /app
ADD . /app/
COPY entrypoint.sh /app/

# SET DEFAULT ENV VAR
ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# INSTALL SYSTEM DEPENDENCIES
RUN apt-get update && apt-get install -y --no-install-recommends \
	netcat \
    tzdata \
    python3-setuptools \
    python3-pip \
    python3-dev \
    python3-venv \
    postgresql \
    postgresql-contrib \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/

# INSTALL ENV DEPENDENCIES
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# run entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]