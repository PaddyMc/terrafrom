terraform {
  backend "pg" {}
}

module "namespaces" { 
  source          = "./namespaces" 
  namespace       = "go-apis"
}

module "go_api_deployment_brickblock" { 
  source          = "./deployment" 
  namespace       = "go-apis" 
  deployment_name = "brickblock-blockchain-data" 
  docker_image    = "nginx" 
}

module "go_api_deployment_voting" { 
  source          = "./deployment" 
  namespace       = "go-apis" 
  deployment_name = "voting-blockchain-data" 
  docker_image    = "nginx" 
}