resource "aws_budgets_budget" "monthly_cost" {
  name              = "MonthlyBudget"
  budget_type       = "COST"
  limit_amount      = "100"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2025-01-01_00:00"
}