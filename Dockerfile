FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install software-properties-common -y --no-install-recommends\
    && apt-add-repository ppa:git-core/ppa \
    && apt-get update \
    && apt-get clean

RUN apt-get install -y \
		build-essential \
		wget \
		git \
		curl \
		unzip \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN pip3 --no-cache-dir install --upgrade awscli

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

RUN apt-get install -y nodejs

RUN git version

RUN node -v

RUN npm -v

RUN wget -q https://releases.hashicorp.com/terraform/0.12.19/terraform_0.12.19_linux_amd64.zip && unzip terraform_0.12.19_linux_amd64.zip && mv terraform /usr/local/bin/

CMD ["/bin/bash"]
