output "ecs_role_arn" {
  description = "ARN of the ECS Execution Role"
  value       = aws_iam_role.ecs_role.arn
}