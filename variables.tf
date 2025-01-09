variable "kratix_config" {
  type = any
  default = {
    hostname                     = ""
    values_yaml                  = ""
    autoscaling_enabled          = false
    slack_notification_token     = ""
    ingress_class_name           = ""
  }
  description = "Specify the configuration settings for kratix, including the hostname, and custom YAML values."
}


variable "charts_path" {
  default     = "./helm/kratix"
  description = "The charts full path"
}

variable "chart_version" {
  type        = string
  default     = ""
  description = "Version of the kratix chart"
}

variable "namespace" {
  type        = string
  default     = "kratix""
  description = "Name of the namespace kratix""
}

variable "ingress_class_name" {
  type = string
  default = "ingress-nginx"
  description = "Enter ingress class name which is created in EKS cluster"
}
