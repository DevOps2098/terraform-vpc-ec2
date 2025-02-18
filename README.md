# terraform-vpc-ec2
#Install terraform on Codespace
  sudo apt-get update
  wget -qO- https://apt.releases.hashicorp.com/gpg | sudo tee /etc/apt/trusted.gpg.d/hashicorp.asc
  sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  sudo apt-get update
  sudo apt-get install terraform
  terraform -v
  terraform init
