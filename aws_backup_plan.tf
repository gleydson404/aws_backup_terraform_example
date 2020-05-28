resource "aws_backup_plan" "example" {
  name = "tf_example_backup_plan_for_ec2"

  rule {
    rule_name         = "tf_example_backup_rule"
    target_vault_name = "${aws_backup_vault.example.name}"
    schedule          = "cron(0 12 * * ? *)"
  }
}
