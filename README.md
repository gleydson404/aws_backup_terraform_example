# aws_backup_terraform_example

This project is just an example, some kind of proof of concept for using AWS backup. In this
project we have a some terraform scripts to profiviosing an EC2 instance and an AWS Backup
Plan with all dependencis for this, including rules and selections for the backup plan.

## Things you need to know

> This project uses MFA authentication.

> Once you build this project, when you run the container you will be on bash

> You will have to manually run the necessary scripts

> This project mounts a volumes pointing to `~/.aws/credentials`. So, when you generate a new
> credential, this file will be update also outside the container.


## What is necessary to run this project?

You're gonna need Docker and Docker Compose and that's all.

## Ok, once i installed those dependencies, what i suposed to do?

Now, you need to run on your terminal:

`mv env_sample .env`

and then, open .env with your editor and fill all variables.

ex.:

```
MFA_ARN=arn of your MFA dispositive
PROFILE_AWS=a valid profile on your ~/.aws/credentials file
TF_VAR_PROFILE_AWS_MFA=the name of the new profile that will be generated
AWS_REGION=us-east-1
```

now, just run:

`docker-coompose build`

and then;

`docker-coompose run --rm aws_backup_terraform_example`.

Now, you should be on bash, inside the container.


## Geting a session on AWS

On the container bash, execute:

`sh authenticate_aws.sh`

This script, will ask your MFA code. Type it, and it will generate a new profile with the
new credentials. The name os this profile its configurated by this env TF_VAR_PROFILE_AWS_MFA

### Reminder:

If you have to run the authenticate_aws.sh again, make sure to remove the older profile
generated.



## Ok, i've done all the steps before, when the magic happens?

Take it easy. We are almost done.

Run:

`terraform init`

Wait untill finish and after:

`terraform apply`

This command will ask you to confirm terraform actions. Just type 'yes'.



Once you have played with the scripts, its time to remove all the things we have created on
AWS. For this, run:

`terraform detroy`

and confirm when terraform ask's for confirmation.

Enjoy it!
