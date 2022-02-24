output "genesys_cloud_org_id" {
  value = data.genesyscloud_organizations_me.current.id
}