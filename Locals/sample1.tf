variable "sample" {
  default = "kjsdnfsjd"
}

variable "sample1" {
  default = 100
}

locals {
  sampleall = "${var.sample}-${var.sample1}"
}

output "SAMPLE" {
  value = local.sampleall
}
