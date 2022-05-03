#!/bin/bash

SSH_KEY=~/.ssh/eks-daytwo-east1-key.pem

PUBLIC_DNS=$(aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=dev-workstation-0" \
  --query "Reservations[].Instances[].PublicDnsName" --output text)

USER=ubuntu
HOST=$USER@$PUBLIC_DNS

ssh -i $SSH_KEY -o "StrictHostKeyChecking no" $HOST exit

ssh -i $SSH_KEY $HOST kubectl get all --namespace dev_dr


