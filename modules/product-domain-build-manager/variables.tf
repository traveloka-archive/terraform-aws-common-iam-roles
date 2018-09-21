variable "product_domain" {
  description = "Product domain these resources belong to."
  type        = "string"
}

variable "allowed_principals" {
  description = "List of allowed principals to assume ProductDomainAdmin role"
  type        = "list"
}
