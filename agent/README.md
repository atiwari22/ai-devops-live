# agent

Prompts and runbooks for the coding agent on this repo.

Follow [CLAUDE.md](../CLAUDE.md) on every change:

- AWS region `ap-south-1`, project name `ai-devops-live`
- Terraform uses official `terraform-aws-modules` with a pinned version
- No hardcoded secrets or access keys
- Tag every AWS resource `Project=ai-devops-live`, `owner=abhtiwar`, `Env=demo`
- App namespace is `demo`
- Fixes land in Git. Do not `kubectl edit`
- Keep code simple and commented
