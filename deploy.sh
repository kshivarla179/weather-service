#!/bin/bash

# Set up the GitHub repository details
github_owner="kshivarla179"
github_repo="weather-service"
github_branch="main"
github_path="Weather_Topics_SNS_CF.yaml"

# Set up the S3 bucket details
s3_bucket="your-s3-bucket-name"
s3_key="path/to/your/cloudformation/template.yml"

# Download the CloudFormation template from the GitHub repository
curl -sLJO "https://raw.githubusercontent.com/${github_owner}/${github_repo}/${github_branch}/${github_path}"

# Upload the template to S3
aws s3 cp template.yml s3://${s3_bucket}/${s3_key}

# Deploy the CloudFormation stack using the template stored in S3
aws cloudformation create-stack \
  --stack-name "your-stack-name" \
  --template-url "https://${s3_bucket}.s3.amazonaws.com/${s3_key}" \
  --parameters ParameterKey=your-parameter-key,ParameterValue=your-parameter-value \
  --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM