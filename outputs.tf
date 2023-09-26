# output "InstanceId" {
#     value = aws_instance.terraformVM.key_name
#     precondition {
#         condition = aws_instance.terraformVM.key_name == "SSHkey"
#         error_message = "No es la llave SSH"
#     }
# }

# output "local" {
#     value = {for k, v in aws_instance.terraformVM: k=> v.id}

# }

# output "pru1" {
#     value = aws_instance.terraformVM["Afri"]
# }

output "privateIP" {
    value = aws_instance.VM12.private_ip
}