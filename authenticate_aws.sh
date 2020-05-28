echo Type your token_code
read token_code
credentials=`aws sts get-session-token \
  --serial-number $MFA_ARN \
  --token-code $token_code \
  --duration-seconds 43200 \
  --profile $PROFILE_AWS | jq -r .Credentials`

secret_key=`echo "$credentials" | jq -r .SecretAccessKey`
access_key=`echo "$credentials" | jq -r .AccessKeyId`
session_token=`echo "$credentials" | jq -r .SessionToken`

new_profile="\n[$TF_VAR_PROFILE_AWS_MFA]\naws_access_key_id=${access_key}\naws_secret_access_key=${secret_key}\naws_session_token=${session_token}\nregion=$AWS_REGION"

echo -e $new_profile >> /root/.aws/credentials
