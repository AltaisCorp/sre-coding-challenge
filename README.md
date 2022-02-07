# Altais Challenge

It creates; 
* 1 VPC
* 1 public subnet
* 1 Internet Gateway
* 1 Security Group
* 1 EC2 (installed apache in it)
* S3 Bucket
* S3 Notification
* SQS

After cloning the repo, just run the following commands

```
ssh-keygen -f altais-challenge-key-pair
terraform init
terraform plan -out terraform.out
terraform apply terraform.out
```

To Verify
```
aws s3 ls
aws sqs list-queues
aws s3 cp file.txt $bucket
aws sqs --region us-west-1 receive-message --queue-url
```

Author by Emmanuel Navarro emanuelnavi@gmail.com