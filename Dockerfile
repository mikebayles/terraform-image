FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl

ENV TERRAFORM_VERSION=0.12.5
RUN wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && mv terraform /usr/local/bin/ \
  && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

CMD ["/bin/bash"]
