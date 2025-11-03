# 🧹 Terraform ASG Cleanup Automation

This project automatically tags and deletes old AWS Auto Scaling Groups (ASGs) that are no longer attached to load balancers.

## 💡 Features
- Tags unattached ASGs with a timestamp (`MarkedForDelete`)
- Deletes them automatically after N days (default: 7)
- Safe deletion (`prevent_destroy = false`)
- GitHub Actions automation

## 🚀 Usage
1. Configure AWS credentials in GitHub Secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

2. Adjust schedule in `.github/workflows/terraform-cleanup.yml`

3. Run manually or let it trigger on schedule.

---
