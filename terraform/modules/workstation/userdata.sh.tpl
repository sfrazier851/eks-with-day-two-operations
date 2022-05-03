#!/bin/bash
# setup

sudo apt update
sudo apt-get install -y unzip ansible jq

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v${eks_cluster_version}/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

/usr/local/bin/aws eks update-kubeconfig --name ${eks_cluster_name}

mkdir ~/.aws
touch ~/.aws/credentials

#sudo apt-get install git vim wget -y
#sudo apt install unzip -y
#sudo apt install python-pip -y
#sudo apt install jq -y
#sudo pip install ansible==2.6.5

# setup aws cli
#curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#sudo unzip awscliv2.zip
#sudo ./aws/install
#/usr/local/bin/aws eks update-kubeconfig --name ${eks_cluster_name}
#sudo cp /usr/local/bin/aws2 /usr/local/bin/aws
#sudo pip install awscli

# kubectl
#curl -LO https://storage.googleapis.com/kubernetes-release/release/v${eks_cluster_version}/bin/linux/amd64/kubectl
#sudo chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl
