# Terraform Configuration

## Introduction
These configuration files are part of my project for She Code Africa Cloud School Cohort 2. The main project is in [this repository](https://github.com/Z11mm/sca-project-c2-app-api)

## Install Terraform on Ubuntu
To install Terraform, follow these steps:
* Ensure the gnupg, software-properties-common, and curl packages are available: <br>
    - `sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl` 

* Add the HashiCorp GPG key: <br>
    - `curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`

* Add the official HashiCorp Linux repository: <br>
    - `sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`

* Update to add the repository, and install the Terraform CLI: <br>
    - `sudo apt-get update && sudo apt-get install terraform`
    
* Verify the installation: <br>
    - `terraform -help`

See the Terraform [docs](https://learn.hashicorp.com/tutorials/terraform/install-cli) to install for other distributions.