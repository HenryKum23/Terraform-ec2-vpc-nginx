Description

This is a demo project for provisioning Nginx Webserver on AWS EC2 using Terraform. In this demo, i am provisioning a Nginx instance on AWS EC2 using user data. I also setup a security group with the necessary rules.
Usage

    Execute the command terraform init to setup the project workspace.
    Execute the command terraform apply to provision the infrastructure. This will create a VPC with Private and Public Subnets, a NAT Gateway and an EC2 instances.
    Execute the command terraform destroy to destroy the infrastructure.

Note
The resources created on AWS in this example may incur cost. So please be reminded to destroy the infrastructure once you have successfully deployed the resources, if you don't need it.

Thank you.

Credit: Success Group (DevOps cohort) from Jomacs IT training 2024.
