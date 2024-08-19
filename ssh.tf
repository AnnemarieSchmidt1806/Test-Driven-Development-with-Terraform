resource "azapi_resource" "ssh_public_key" {
    type = "Microsoft.Compute/sshPublicKeys@2022-11-01"
    name = "sshkey-terraform-cloudwalker"
    location = azurerm_resource_group.rg.location
    parent_id = azurerm_resource_group.rg.id

    body = jsonencode ({
        properties = {
            publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCWQYqmcwFST7WkPUW3gne+tFepfz1YPy8dtsq+bVO6yVyl78kHsdhEQyg6et4j5gV4I/C5OMviO1Jaf4N0lJnjpHk7/veQSd/1+4gea/vo8aA3fAzXnsrdCfFY+5txfvKdPzqporuPRJuYQJ2cItZ71h6zB9GmHc7Ct24fcA8FtlB5BjOfslCuhG/TymbCAzeeryYvxXH0O/HAMQXBvEvVo0ZEGct18LMrivtZnydfpaVeyT+OjOFvuKgaFEHuvUi2D4hVrnOt26zgPgr1gnZeoO4RLHt8gV5PmXeUnrxjXI35zpZS+TN/NoupEGm3xVtd7eTO0W6jPMcCKLFk0WDbR2OFdChdDPmn+gnEHkLbji20N5s6+yk/vzgXSn/I+Bs3KIKkvdcz7EYyw5sGBftBXWSJ2yuMZFVa1peee5k8kfXYpo2zkzIBIJ0iXP7i7d0w3eiafcxD1DnCDdBE0FNz9552xHTGSvevuSG9gwh179eILJycrM0+w2B4ivOPVDE= annemarieschmidt@Annemaries-MacBook-Pro.local"
        }
    })
}



