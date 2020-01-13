FROM ubuntu:18.04

ENV DOCKER_BUCKET="download.docker.com" \
    DOCKER_VERSION="17.09.0-ce" \
    TF_VERSION="0.12.19" \
    GITVERSION_VERSION="3.6.5"

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
	zip \
	rsync \
	jq \
    python3 python3-pip python3-setuptools \
    groff \
    less \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN pip3 install --upgrade --force-reinstall pip && pip3 --no-cache-dir install --upgrade awscli

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash &&  apt-get install -y nodejs

#RUN npm i -g serverless@1.49.1 typescript

RUN wget -q https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip \
	&& unzip terraform_${TF_VERSION}_linux_amd64.zip \
	&& mv terraform /usr/local/bin/ \
	&& rm -rf terraform_${TF_VERSION}_linux_amd64.zip

ADD assume_role /usr/local/bin/assume_role
RUN chmod +x /usr/local/bin/assume_role

CMD ["/usr/bin/bash"]

