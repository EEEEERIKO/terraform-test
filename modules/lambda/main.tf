data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "this" {
  name   = "${var.role_name}-policy"
  role   = aws_iam_role.this.id
  policy = jsonencode(var.inline_policy)
}

resource "aws_lambda_function" "this" {
  filename         = var.lambda_zip
  function_name    = var.function_name
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.this.arn
  source_code_hash = filebase64sha256(var.lambda_zip)
  timeout          = var.timeout
  environment {
    variables = var.environment_variables
  }
}
