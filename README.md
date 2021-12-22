# sre-coding-challenge
Public Repo for Altais Coding Challenge

please configure aws access keys with "aws configure", everything was tested on us-east-1

terraform init
terraform plan
terraform destroy

1. Upload S3 bucket text file, Total time: 1 Hour.

2. Add S3 notification to SNS topic (modify email accordingly!), Total time: 1 Hour.

3. Unit test with Terratest to check if website is deploy correctly, 1 Hour to learn Terratest, 1 Hour for implementation, Total time: 2 Hours. 
    go get 
    go build / go test to install dependencies 
    go mod init test
    cd test/
    go test -v  

4. Kubernetes Helm chart dashboard deploy in minikube, 1 Hour Planning, 2 Hours implementing, Total time: 3 Hours. 
    minikube start --driver=docker
    minikube tunnel
    helm repo update

5. AWS deployment: VPC, IGW, RT, subnet, SG, EC2 with httpd, 1 Hour planning, 2 Hours implementing, Total time: 3 Hours.


Time is an Ilussion 

Total time for the test: 10 Hours. 