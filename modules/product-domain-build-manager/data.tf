data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_iam_policy_document" "assume_role" {
  "statement" {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "${var.allowed_principals}",
      ]
    }

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"

      values = [
        "true",
      ]
    }
  }
}

data "aws_iam_policy_document" "codepipeline" {
  statement {
    sid = "AllowToListCodepipelinePipelines"

    effect = "Allow"

    actions = [
      "codepipeline:ListPipelines",
    ]

    resources = [
      "arn:aws:codepipeline:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*",
    ]
  }

  statement {
    sid = "AllowToManageCodepipelinePipeline"

    effect = "Allow"

    actions = [
      "codepipeline:CreatePipeline",
      "codepipeline:DeletePipeline",
      "codepipeline:GetPipeline",
      "codepipeline:GetPipelineExecution",
      "codepipeline:GetPipelineState",
      "codepipeline:ListPipelineExecutions",
      "codepipeline:StartPipelineExecution",
      "codepipeline:UpdatePipeline",
    ]

    resources = [
      "arn:aws:codepipeline:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToManageCodepipelineStage"

    effect = "Allow"

    actions = [
      "codepipeline:DisableStageTransition",
      "codepipeline:EnableStageTransition",
      "codepipeline:RetryStageExecution",
    ]

    resources = [
      "arn:aws:codepipeline:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${var.product_domain}*/*",
    ]
  }
}

data "aws_iam_policy_document" "codebuild" {
  statement {
    sid = "AllowToPassRole"

    effect = "Allow"

    actions = [
      "iam:PassRole",
    ]

    resources = [
      "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/service-role/codebuild.amazonaws.com/ServiceRoleForCodebuild_${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToCreateCodebuildProject"

    effect = "Allow"

    actions = [
      "codebuild:CreateProject",
    ]

    resources = [
      "arn:aws:codebuild:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:project/${var.product_domain}*",
    ]

    condition = {
      test     = "StringLike"
      variable = "aws:RequestTag/Name"

      values = [
        "${var.product_domain}*",
      ]
    }

    condition = {
      test     = "StringEquals"
      variable = "aws:RequestTag/ProductDomain"

      values = [
        "${var.product_domain}",
      ]
    }

    condition = {
      test     = "StringLike"
      variable = "aws:RequestTag/Service"

      values = [
        "${var.product_domain}*",
      ]
    }

    condition = {
      test     = "StringEquals"
      variable = "aws:RequestTag/Environment"

      values = [
        "management",
      ]
    }

    condition = {
      test     = "StringEquals"
      variable = "aws:RequestTag/ManagedBy"

      values = [
        "Terraform",
      ]
    }
  }

  statement {
    sid = "AllowToManageCodebuildProject"

    effect = "Allow"

    actions = [
      "codebuild:DeleteProject",
      "codebuild:UpdateProject",
    ]

    resources = [
      "arn:aws:codebuild:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:project/${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToListCodebuildProject"

    effect = "Allow"

    actions = [
      "codebuild:BatchGetProjects",
      "codebuild:ListProjects",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "AllowToManageCodebuildBuild"

    effect = "Allow"

    actions = [
      "codebuild:BatchDeleteBuilds",
      "codebuild:BatchGetBuilds",
      "codebuild:ListBuildsForProject",
      "codebuild:StartBuild",
      "codebuild:StopBuild",
    ]

    resources = [
      "arn:aws:codebuild:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:project/${var.product_domain}*",
    ]
  }

  statement {
    sid = "AllowToGetEventRule"

    effect = "Allow"

    actions = [
      "events:ListRuleNamesByTarget",
    ]

    resources = [
      "arn:aws:events:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*",
    ]
  }

  statement {
    sid = "AllowToAccessCloudwatch"

    effect = "Allow"

    actions = [
      "cloudwatch:ListMetrics",
      "cloudwatch:GetMetricStatistics",
    ]

    resources = [
      "*",
    ]
  }
}

data "aws_iam_policy_document" "cloudwatch_logs" {
  statement {
    sid = "AllowToDescribeLogGroups"

    effect = "Allow"

    actions = [
      "logs:DescribeLogGroups",
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:*",
    ]
  }

  statement {
    sid = "AllowToDescribeLogStreams"

    effect = "Allow"

    actions = [
      "logs:DescribeLogStreams",
      "logs:GetLogEvents",
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/codebuild/${var.product_domain}*:log-stream:*",
    ]
  }
}

data "aws_iam_policy_document" "image" {
  statement {
    sid = "AllowToManageImage"

    effect = "Allow"

    actions = [
      "ec2:DescribeImageAttribute",
      "ec2:DescribeImages",
      "ec2:DescribeTags",
      "ec2:DeregisterImage",
      "ec2:ModifyImageAttribute",
    ]

    resources = [
      "*",
    ]
  }
}
