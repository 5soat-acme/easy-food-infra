# Easy Food Infra

## Arquivos Terraform :cloud:
Na pasta **terraform** há os arquivos do Terraform para gerenciar a infraestrutura Kubernetes do projeto **[Easy Food](https://github.com/5soat-acme/easy-food)**.

Os arquivos Terraform contidos nesse repositório cria a seguinte infraestrutura na AWS:
- Cluster EKS com um node group
- Instala e configura no cluster EKS um Ingress NGINX Controller.

**Obs.:** Necessário informar no arquivo **terraform/variables.tf** as informações referentes a VPC e as Roles da conta da AWS Academy

## Workflow - Github Action :arrow_forward:
O repositório ainda conta com um workflow para criar a infraestrutura na AWS quando houver **push** na branch **main**. Ao final do workflow, é aplicado os manifestos kubernetes na infraestrutura criada. Os manifestos estão na pasta **kubernetes**.

Para o correto funcionamento do workflow é necessário configurar as seguintes secrets no repositório, de acordo com a conta da AWS Academy:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_SESSION_TOKEN

## Configuração manifestos kubernetes :clipboard:
### ConnectionString
Necessário configurar a tag ```ConnectionStrings``` do ```appsettings.json``` dentro do manifesto ```kubernetes/service.yaml``` de acordo com o **endpoint**, o **usuário** e **senha** do Cluster RDS Aurora PostgreSQL criado pelo repositório **[easy-food-infra-database](https://github.com/5soat-acme/easy-food-infra-database)**.<br>
Exemplo:
```
"ConnectionStrings": {
    "DefaultConnection": "Host=easy-food.cluster-cnwy4oyyacjn.us-east-1.rds.amazonaws.com;Port=5432;Database=easy_food;Username=postgres;Password=acmeacme"
  }
```
### Autenticação com Token gerado pelo Cognito
Necessário configurar a tag ```IdentidadeSettings``` do ```appsettings.json``` dentro do manifesto ```kubernetes/service.yaml``` de acordo com a **região**, o **ID do grupo de usuários** e o **ID do cliente** do Cognito criado pelo repositório **[easy-food-lambda](https://github.com/5soat-acme/easy-food-lambda)**.<br>
Exemplo:
```
"IdentidadeSettings": {
"Secret": "E076B751-88AC-4344-A931-88ABFD665916",
"ExpirationHours": 2,
"Issuer": "https://cognito-idp.{region}.amazonaws.com/{id-grupo-usuario}",
"ValidIn": "{id-cliente}"
}
```
Substituir os trechos ```{region}```, ```{id-grupo-usuario}``` e ```{id-cliente}``` por dados reais.
