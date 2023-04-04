variable "region" {
  description = "The region to deploy in."
  default     = "us-east-2"
  type        = string
}

variable "default_tags" {
  description = "A set of tags to attach to all components."
  default = {
    app = "url_shortener"
  }
  type = map(string)
}
