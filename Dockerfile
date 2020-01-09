FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install software-properties-common -y --no-install-recommends\
    && apt-add-repository ppa:git-core/ppa \
    && apt-get update

RUN apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools \
        groff \
        less \
    && pip3 install --upgrade pip \
    && apt-get clean

RUN pip3 --no-cache-dir install --upgrade awscli

RUN apt-get build-dep wget

RUN wget -q https://releases.hashicorp.com/terraform/0.12.19/terraform_0.12.19_linux_amd64.zip && unzip terraform_0.12.19_linux_amd64.zip && sudo mv terraform /usr/local/bin/

CMD ["/bin/bash"]
