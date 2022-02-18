# 03-s3-notification

## Description

Deploys the sns topic, access policy, subscription and s3 bucket used for the upload file/object notification challenge.

# Test

aws s3 cp variables.tf s3://${bucket_name}

receive the e-mail to the e-mail address that was provided during the terraform apply 
