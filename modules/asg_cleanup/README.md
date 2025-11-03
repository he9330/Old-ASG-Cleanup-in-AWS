# Module: ASG Cleanup

Tags unattached Auto Scaling Groups with a timestamp and deletes them after a configured number of days.

## Inputs
| Name | Description | Default |
|------|--------------|----------|
| region | AWS region | n/a |
| asg_expiry_days | Days before ASG deletion | 7 |

## Outputs
| Name | Description |
|------|--------------|
| marked_asgs | ASGs tagged for cleanup |
| deleted_asgs | ASGs deleted in current run |
