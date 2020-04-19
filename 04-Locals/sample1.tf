variable "sample" {
  default = "kjsdnfsjd"
}

variable "sample1" {
  default = 100
}

variable "sample2" {
  type = list
  default = ["naveen","Tangela"]
}

locals {
  sampleall = "${var.sample}-${var.sample1}-${var.sample2[1]}"
}

output "SAMPLE" {
  value = local.sampleall
}
