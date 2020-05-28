from  hashicorp/terraform:light

RUN apk update && apk add bash
RUN apk add jq
RUN apk add python3
RUN pip3 install awscli

RUN mkdir /aws_backup_terraform_example
ADD . /aws_backup_terraform_example
WORKDIR /aws_backup_terraform_example

ENTRYPOINT bash
