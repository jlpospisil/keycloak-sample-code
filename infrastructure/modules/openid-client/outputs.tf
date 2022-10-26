output "client" {
  value = keycloak_openid_client.openid_client
  sensitive = true
}
