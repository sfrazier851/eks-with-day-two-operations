#!/bin/bash

SSH_KEY=~/.ssh/eks-daytwo-east1-key.pem

PUBLIC_DNS=$(aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=dev-workstation-0" \
  --query "Reservations[].Instances[].PublicDnsName" --output text)

USER=ubuntu
HOST=$USER@$PUBLIC_DNS

ssh -i $SSH_KEY -o "StrictHostKeyChecking no" $HOST exit
ssh -i $SSH_KEY $HOST sudo apt install -y jq
ssh -i $SSH_KEY $HOST -- mkdir /home/ubuntu/.aws
scp -i $SSH_KEY ~/.aws/credentials $HOST:~/.aws/credentials

ssh -i $SSH_KEY $HOST aws eks update-kubeconfig --name dev-eks-cluster
ssh -i $SSH_KEY $HOST kubectl get ns

ssh -i $SSH_KEY $HOST "cd /home/$USER; git clone https://github.com/sfrazier851/eks-with-day-two-operations.git; \
                      cd eks-with-day-two-operations/ansible; \
                      sudo ansible-playbook -i environments/dev velero.yml --ask-vault-pass"



