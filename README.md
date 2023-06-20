This repository contains the necessary scripts and instructions to provision the infrastructure components for Challenge 1. The goal is to set up a secure environment using Terraform, including compute instances, subnets, a load balancer, and more. Additionally, the provisioning process will install JDK8 and Docker engine on the App Server compute instance.


**Prerequisites**
Before proceeding with the provisioning process, make sure you have the following dependencies installed:

Terraform (version >= 0.12)
JDK8
Docker engine
Infrastructure Setup
Clone this repository to your local machine:
shell
Copy code
git clone https://github.com/murremway/challenge.git


Modify the terraform.tfvars file to customize the infrastructure configuration according to your needs. Ensure that you set the appropriate  region, instance types, subnets, and any other relevant variables.

Provisioning Process
Initialize Terraform by running the following command:


terraform init

terraform plan


terraform apply -auto-approve


Sit back and relax while Terraform provisions the required resources based on the specified configuration. This may take a few minutes.

Once the provisioning process completes successfully, you will see the output indicating the provisioned resources, including compute instances, subnets, and load balancers.

also the bootscript.sh was designed to install JDK8 and also Install Docker

Then switch to root user and pull down the docker image which was built with github actions. its the index.html file built into docker image and then run the image into a container
