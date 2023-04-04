variable "shorten_path" {
  default     = "/enshortinator"
  description = "The path for the shorten endpoint (changes trigger redeploy)"
  type        = string
}

variable "hydrate_path" {
  default     = "/e/{shortcode}"
  description = "The path including the path parameter for the URL short code (changes trigger redeploy)"
  type        = string
}
