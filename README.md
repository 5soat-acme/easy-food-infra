# Easy Food Infra

## Arquivos Terraform
Na pasta **terraform** há os arquivos do Terraform para gerenciar a infraestrutura do projeto **[Easy Food](https://github.com/5soat-acme/easy-food)**.

Os arquivos Terraform contidos nesse repositório cria a seguinte infraestrutura na AWS:
- VPC com suas subnets
- Cluster EKS com um node group
- Instala e configura no cluster EKS um Ingress NGINX Controller.

## Workflow - Github Action
O repositório ainda conta com um workflow para criar a infraestrutura na AWS quando houver **push** na branch **main**.

Para o correto funcionamento do workflow é necessário configurar as seguintes secrets no repositório, de acordo com a conta AWS Academy:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_SESSION_TOKEN