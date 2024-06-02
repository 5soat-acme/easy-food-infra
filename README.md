# Easy Food Infra

## Arquivos Terraform :cloud:
Na pasta **terraform** há os arquivos do Terraform para gerenciar a infraestrutura Kubernetes e as filas do AWS SQS para comunicação entre os microsserviços do projeto **[Easy Food](https://github.com/5soat-acme/easy-food)**. Microsserviços:
- [Easy Food Pedido](https://github.com/5soat-acme/easy-food-pedido)
- [Easy Food Pagamento](https://github.com/5soat-acme/easy-food-pagamento)
- [Easy Food Preparo e Entrega](https://github.com/5soat-acme/easy-food-preparoentrega)

<br>

Os arquivos Terraform contidos nesse repositório cria a seguinte infraestrutura na AWS:
- Cluster EKS com um node group
- Instala e configura no cluster EKS um Ingress NGINX Controller.
- Fila no AWS SQS
  - PagamentoAutorizado e PagamentoAutorizado-dlq
  - PedidoRecebido e PedidoRecebido-dlq
  - PreparoPedidoIniciado e PreparoPedidoIniciado-dlq
  - PreparoPedidoFinalizado e PreparoPedidoFinalizado-dlq
  - EntregaPedidoRealizada e EntregaPedidoRealizada-dlq

**Obs.:** Necessário informar no arquivo **terraform/variables.tf** as informações referentes a VPC e as Roles da conta da AWS Academy

## Workflow - Github Action :arrow_forward:
O repositório ainda conta com um workflow para criar a infraestrutura na AWS quando houver **push** na branch **main**. Ao final do workflow, é aplicado os manifestos kubernetes na infraestrutura criada. Os manifestos estão na pasta **kubernetes**.

Para o correto funcionamento do workflow é necessário configurar as seguintes secrets no repositório, de acordo com a conta da AWS Academy:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_SESSION_TOKEN

## Configuração manifestos kubernetes :clipboard:

### Easy Food Pedido
- **ConnectionString** <br>
Necessário configurar a tag ```ConnectionStrings``` do ```appsettings.json``` dentro do manifesto ```kubernetes/pedido/secret.yaml``` de acordo com o **endpoint**, o **usuário** e **senha** do Cluster RDS Aurora PostgreSQL criado pelo repositório **[easy-food-infra-database](https://github.com/5soat-acme/easy-food-infra-database)** para o banco de dados do microsserviço de **Pedido**.<br>

- **Autenticação com Token gerado pelo Cognito** <br>
Necessário configurar a tag ```IdentidadeSettings``` do ```appsettings.json``` dentro do manifesto ```kubernetes/pedido/secret.yaml``` de acordo com a **região**, o **ID do grupo de usuários** e o **ID do cliente** do Cognito criado pelo repositório **[easy-food-lambda](https://github.com/5soat-acme/easy-food-lambda)**.<br>

- **Configurações AWS** <br>
Necessário configurar a tag ```AWSCredentials``` do ```appsettings.json``` dentro do manifesto ```kubernetes/pedido/secret.yaml``` de acordo com as configurações da AWS.<br>

- **appsettings.json completo**
```
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*",
  "ConnectionStrings": {
    "DefaultConnection": "Host={host};Port=5432;Database=easy_food_pedido;Username=postgres;Password=acmeacme"
  },
  "IdentidadeSettings": {
    "Secret": "E076B751-88AC-4344-A931-88ABFD665916",
    "ExpirationHours": 2,
    "Issuer": "https://cognito-idp.{region}.amazonaws.com/{id-grupo-usuario}",
    "ValidIn": "{id-cliente}"
  },
  "AWSCredentials": {
    "AccessKey": "",
    "SecretKey": "",
    "SessionToken": "",
    "Region": "{region}"
  }
}
```

Substituir os trechos  ```{host} ```, ```{region}```, ```{id-grupo-usuario}``` e ```{id-cliente}``` por dados reais. Também preencher a tag ```AWSCredentials``` com dados reais.

### Easy Food Pagamento
- **Autenticação com Token gerado pelo Cognito** <br>
Necessário configurar a tag ```IdentidadeSettings``` do ```appsettings.json``` dentro do manifesto ```kubernetes/pagamento/secret.yaml``` de acordo com a **região**, o **ID do grupo de usuários** e o **ID do cliente** do Cognito criado pelo repositório **[easy-food-lambda](https://github.com/5soat-acme/easy-food-lambda)**.<br>

- **Configurações AWS** <br>
Necessário configurar a tag ```AWSCredentials``` do ```appsettings.json``` dentro do manifesto ```kubernetes/pagamento/secret.yaml``` de acordo com as configurações da AWS.<br>

- **appsettings.json completo**
```
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*",
  "IdentidadeSettings": {
    "Secret": "E076B751-88AC-4344-A931-88ABFD665916",
    "ExpirationHours": 2,
    "Issuer": "https://cognito-idp.{region}.amazonaws.com/{id-grupo-usuario}",
    "ValidIn": "{id-cliente}"
  },
  "PagamentoAutorizacaoWebHook": {
    "Key": "9E541194-61B4-44F6-BE2A-B1F08C24BB52"
  },
  "AWSCredentials": {
    "AccessKey": "",
    "SecretKey": "",
    "SessionToken": "",
    "Region": "{region}"
  }
}
```

Substituir os trechos  ```{region}```, ```{id-grupo-usuario}``` e ```{id-cliente}``` por dados reais. Também preencher a tag ```AWSCredentials``` com dados reais.

### Easy Food Preparo e Entrega
- **ConnectionString** <br>
Necessário configurar a tag ```ConnectionStrings``` do ```appsettings.json``` dentro do manifesto ```kubernetes/preparoentrega/secret.yaml``` de acordo com o **endpoint**, o **usuário** e **senha** do Cluster RDS Aurora PostgreSQL criado pelo repositório **[easy-food-infra-database](https://github.com/5soat-acme/easy-food-infra-database)** para o banco de dados do microsserviço de **Preparo e Entrega**.<br>

- **Autenticação com Token gerado pelo Cognito** <br>
Necessário configurar a tag ```IdentidadeSettings``` do ```appsettings.json``` dentro do manifesto ```kubernetes/preparoentrega/secret.yaml``` de acordo com a **região**, o **ID do grupo de usuários** e o **ID do cliente** do Cognito criado pelo repositório **[easy-food-lambda](https://github.com/5soat-acme/easy-food-lambda)**.<br>

- **Configurações AWS** <br>
Necessário configurar a tag ```AWSCredentials``` do ```appsettings.json``` dentro do manifesto ```kubernetes/preparoentrega/secret.yaml``` de acordo com as configurações da AWS.<br>

- **appsettings.json completo**
```
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*",
  "ConnectionStrings": {
    "DefaultConnection": "Host={host};Port=5432;Database=easy_food_preparoentrega;Username=postgres;Password=acmeacme"
  },
  "IdentidadeSettings": {
    "Secret": "E076B751-88AC-4344-A931-88ABFD665916",
    "ExpirationHours": 2,
    "Issuer": "https://cognito-idp.{region}.amazonaws.com/{id-grupo-usuario}",
    "ValidIn": "{id-cliente}"
  },
  "AWSCredentials": {
    "AccessKey": "",
    "SecretKey": "",
    "SessionToken": "",
    "Region": "{region}"
  }
}
```

Substituir os trechos  ```{host} ```, ```{region}```, ```{id-grupo-usuario}``` e ```{id-cliente}``` por dados reais. Também preencher a tag ```AWSCredentials``` com dados reais.