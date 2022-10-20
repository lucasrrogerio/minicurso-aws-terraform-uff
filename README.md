
# Conectando-se à uma instância AWS em sub-rede privada utilizando um host bastião

## Instruções

O primeiro passo é gerar as chaves SSH. Crie um diretório chamado `keys` e crie as chaves com o seguinte comando: 

```
# criar as chaves
ssh-keygen -f mykeypair

```

Após a criação dos arquivos tf, executar os seguintes comandos:

```
# baixar os arquivos necessários do provider
terraform init

# verificar a configuração dos recursos que serão criados
terraform plan

# aplicar a configuração para criar os recursos
terraform apply
```