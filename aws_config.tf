variable "PROFILE_AWS_MFA" {
    type = "string"
}
provider "aws"{
    profile = var.PROFILE_AWS_MFA
}
