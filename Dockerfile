FROM ubuntu:18.04

ENV TERRAFORM_VERSION=0.12.5
ENV TERRAFORM_SHA256SUM=babb4a30b399fb6fc87a6aa7435371721310c2e2102a95a763ef2c979ab06ce2

RUN mkdir -p ~/.ssh && echo "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

COPY files/terminal-to-html /usr/local/bin/

RUN apt-get update && apt-get -y dist-upgrade && apt-get autoremove && apt-get install -y ruby-full zip curl wget jq tree git && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -c terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /bin/terraform && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN gem install terraform_landscape

CMD ["/bin/bash"]
