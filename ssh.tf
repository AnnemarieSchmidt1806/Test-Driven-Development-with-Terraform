resource "random_pet" "ssh_key_name" {
    prefix = "ssh"
    separator = ""
}

resource "azapi_resource_action" "ssh_public_key_gen" {
    type = "Microsoft.Compute/sshPublicKeys@2022-11-01"
    resource_id = azapi_resource.ssh_public_key.id
    action = "generateKeyPair"
    method = "POST"

    response_export_values = ["publicKey", "privateKey"]
}

resource "azapi_resource" "ssh_public_key" {
    type = "Microsoft.Compute/sshPublicKeys@2022-11-01"
    name = "sshkey-terraform-cloudwalker"
    location = azurerm_resource_group.rg.location
    parent_id = azurerm_resource_group.rg.id

    body = jsonencode ({
        properties = {
            publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCueJ7xmB4ni8COeSkQt+mO2CPAB4MwMNj2rQN1aMKPJBIPrZnuJylMsqY/SZPhR/lH5E9knHTRDp+IuVDIEKkOVWRTEiyFXnT/Y3axNWEOmxrbdg7sUyKxe3YWfWxsc9X9e7nJ9+FUCJzsuHINiqs7NRPpTkwG7+pV08DCleFJ6G3cCQKT41stmB4YTbXaR421QY0HWINhLMaBhE+0bxgq6jnw8iHadCNkSUfvCcj9W7DmUQKX33QBBdZ5ss4VHJ2wsLieRIWHKFLgp3QZZJuXfd+Im2C3ZrKRl29nuaVQtuQ3Pl4nwBoidS6vpZP5C4B38yJn/cIC2SwFFtndSH+wdbIAwFLI80gUY8iubfn7X9szf/coFJEgkV/b3dS5+DgQBWJ1VqHEy4sl8wTWVJVFntE0s37BV9cXjOw/9pASuZlaCXHEOvfSyfceMSxhU6ADl3xk/qZiI8ntJ37DznEySGpp2t/RSf1H/OBexcEo5hd4rV6FspQg4eH+NS9GoLp+ycJmf6Dy9gNT71DAN/4WBi0+i7QpdAsvCBCNQ8UAIxZ1EmNJJFgspSdesusmWUMaoME/o/o3vR5pcIvTVagTiuysd735EjjAbZussSRs/M5N7A9ZAI5LbF/bSKuwKozXIHeC0C6ERsZHeeszZ12HeSZsIzG3mLGvzNOF3VCQhQ== azureadmin@4.184.214.13"
        }
    })
}


output "key_data" {
    value = azapi_resource_action.ssh_public_key_gen.output.publicKey
}
