

provider "aws" {
  region = var.region
  profile = "swarms"
}

module "aws_oidc_github" {
  source = "../../"

  enabled = var.enabled

  additional_audiences          = var.additional_audiences
  additional_thumbprints        = var.additional_thumbprints
  attach_admin_policy           = var.attach_admin_policy
  attach_read_only_policy       = var.attach_read_only_policy
  create_oidc_provider          = var.create_oidc_provider
  enterprise_slug               = var.enterprise_slug
  force_detach_policies         = var.force_detach_policies
  iam_role_name                 = var.iam_role_name
  iam_role_path                 = var.iam_role_path
  iam_role_permissions_boundary = var.iam_role_permissions_boundary
#  iam_role_policy_arns          = var.iam_role_policy_arns
  github_repositories           = var.github_repositories
  max_session_duration          = var.max_session_duration
  tags                          = var.tags

  iam_role_policy_arns = [
    aws_iam_policy.terraform_pike.arn,
    aws_iam_policy.terraform_pike2.arn,
    aws_iam_policy.terraform_pike3.arn,
    aws_iam_policy.github_ssm_policy.arn
  ]
}

resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "acm:AddTagsToCertificate",
                "acm:DeleteCertificate",
                "acm:DescribeCertificate",
                "acm:ListTagsForCertificate",
                "acm:RemoveTagsFromCertificate",
                "acm:RequestCertificate"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor100",
            "Effect": "Allow",
            "Action": [
                "apigateway:SetWebACL"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor200",
            "Effect": "Allow",
            "Action": [
                "apprunner:AssociateWebAcl",
                "apprunner:DescribeWebAclForService",
                "apprunner:DisassociateWebAcl",
                "apprunner:ListAssociatedServicesForWebAcl"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor003",
            "Effect": "Allow",
            "Action": [
                "appsync:SetWebACL"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor004",
            "Effect": "Allow",
            "Action": [
                "autoscaling:AttachTrafficSources",
                "autoscaling:CreateAutoScalingGroup",
                "autoscaling:CreateOrUpdateTags",
                "autoscaling:DeleteAutoScalingGroup",
                "autoscaling:DeleteLifecycleHook",
                "autoscaling:DeletePolicy",
                "autoscaling:DeleteScheduledAction",
                "autoscaling:DeleteTags",
                "autoscaling:Describe*",
                "autoscaling:DescribeAdjustmentTypes",
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:DescribePolicies",
                "autoscaling:DescribeScalingActivities",
                "autoscaling:DescribeScheduledActions",
                "autoscaling:DescribeTerminationPolicyTypes",
                "autoscaling:DescribeTrafficSources",
                "autoscaling:DetachTrafficSources",
                "autoscaling:DisableMetricsCollection",
                "autoscaling:EnableMetricsCollection",
                "autoscaling:ExecutePolicy",
                "autoscaling:PutLifecycleHook",
                "autoscaling:PutScalingPolicy",
                "autoscaling:PutScheduledUpdateGroupAction",
                "autoscaling:UpdateAutoScalingGroup"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor005",
            "Effect": "Allow",
            "Action": [
                "cloudwatch:GetMetricData"
            ],
            "Resource": [
                "*"
            ]
	}
    ]
  }
    )
}
 

resource "aws_iam_policy" "terraform_pike3" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
            "Sid": "VisualEditor006",
            "Effect": "Allow",
            "Action": [
                "cognito-idp:AssociateWebACL",
                "cognito-idp:DisassociateWebACL",
                "cognito-idp:GetWebACLForResource",
                "cognito-idp:ListResourcesForWebACL"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor007",
            "Effect": "Allow",
            "Action": [
                "ec2:AllocateAddress",
                "ec2:AssignPrivateNatGatewayAddress",
                "ec2:AssociateAddress",
                "ec2:AssociateDhcpOptions",
                "ec2:AssociateNatGatewayAddress",
                "ec2:AssociateRouteTable",
                "ec2:AssociateSubnetCidrBlock",
                "ec2:AssociateVpcCidrBlock",
                "ec2:AttachInternetGateway",
                "ec2:AttachVpnGateway",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CreateCustomerGateway",
                "ec2:CreateDefaultVpc",
                "ec2:CreateDhcpOptions",
                "ec2:CreateEgressOnlyInternetGateway",
                "ec2:CreateFlowLogs",
                "ec2:CreateInternetGateway",
                "ec2:CreateLaunchTemplate",
                "ec2:CreateLaunchTemplateVersion",
                "ec2:CreateNatGateway",
                "ec2:CreateNetworkAcl",
                "ec2:CreateNetworkAclEntry",
                "ec2:CreateRoute",
                "ec2:CreateRouteTable",
                "ec2:CreateSecurityGroup",
                "ec2:CreateSubnet",
                "ec2:CreateTags",
                "ec2:CreateVPC",
                "ec2:CreateVpnGateway",
                "ec2:DeleteCustomerGateway",
                "ec2:DeleteDhcpOptions",
                "ec2:DeleteEgressOnlyInternetGateway",
                "ec2:DeleteFlowLogs",
                "ec2:DeleteInternetGateway",
                "ec2:DeleteLaunchTemplate",
                "ec2:DeleteNatGateway",
                "ec2:DeleteNetworkAcl",
                "ec2:DeleteNetworkAclEntry",
                "ec2:DeleteNetworkInterface",
                "ec2:DeleteRoute",
                "ec2:DeleteRouteTable",
                "ec2:DeleteSecurityGroup",
                "ec2:DeleteSubnet",
                "ec2:DeleteTags",
                "ec2:DeleteVPC",
                "ec2:DeleteVpnGateway",
                "ec2:Describe*",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAddresses",
                "ec2:DescribeCustomerGateways",
                "ec2:DescribeDhcpOptions",
                "ec2:DescribeEgressOnlyInternetGateways",
                "ec2:DescribeFlowLogs",
                "ec2:DescribeImages",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeInternetGateways",
                "ec2:DescribeLaunchTemplateVersions",
                "ec2:DescribeLaunchTemplates",
                "ec2:DescribeNatGateways",
                "ec2:DescribeNetworkAcls",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeRouteTables",
                "ec2:DescribeSecurityGroupRules",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcAttribute",
                "ec2:DescribeVpcs",
                "ec2:DescribeVpnGateways",
                "ec2:DetachInternetGateway",
                "ec2:DetachNetworkInterface",
                "ec2:DetachVpnGateway",
                "ec2:DisableVgwRoutePropagation",
                "ec2:DisassociateAddress",
                "ec2:DisassociateNatGatewayAddress",
                "ec2:DisassociateRouteTable",
                "ec2:DisassociateSubnetCidrBlock",
                "ec2:DisassociateVpcCidrBlock",
                "ec2:EnableVgwRoutePropagation",
                "ec2:Get*",
                "ec2:ModifySubnetAttribute",
                "ec2:ModifyVpcAttribute",
                "ec2:ModifyVpcTenancy",
                "ec2:ReleaseAddress",
                "ec2:ReplaceNetworkAclEntry",
                "ec2:ReplaceRoute",
                "ec2:ReplaceRouteTableAssociation",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:RunInstances",
                "ec2:UnassignPrivateNatGatewayAddress"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor008",
            "Effect": "Allow",
            "Action": [
                "elasticache:AddTagsToResource",
                "elasticache:CreateCacheSubnetGroup",
                "elasticache:DeleteCacheSubnetGroup",
                "elasticache:DescribeCacheSubnetGroups",
                "elasticache:ListTagsForResource",
                "elasticache:ModifyCacheSubnetGroup",
                "elasticache:RemoveTagsFromResource"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor009",
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:AddListenerCertificates",
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:AttachLoadBalancerToSubnets",
                "elasticloadbalancing:CreateListener",
                "elasticloadbalancing:CreateLoadBalancer",
                "elasticloadbalancing:CreateLoadBalancerListeners",
                "elasticloadbalancing:CreateRule",
                "elasticloadbalancing:CreateTargetGroup",
                "elasticloadbalancing:DeleteListener",
                "elasticloadbalancing:DeleteLoadBalancer",
                "elasticloadbalancing:DeleteRule",
                "elasticloadbalancing:DeleteTargetGroup",
                "elasticloadbalancing:DeregisterTargets",
                "elasticloadbalancing:DescribeListenerCertificates",
                "elasticloadbalancing:DescribeListeners",
                "elasticloadbalancing:DescribeLoadBalancerAttributes",
                "elasticloadbalancing:DescribeLoadBalancers",
                "elasticloadbalancing:DescribeRules",
                "elasticloadbalancing:DescribeTags",
                "elasticloadbalancing:DescribeTargetGroupAttributes",
                "elasticloadbalancing:DescribeTargetGroups",
                "elasticloadbalancing:DescribeTargetHealth",
                "elasticloadbalancing:ModifyListener",
                "elasticloadbalancing:ModifyLoadBalancerAttributes",
                "elasticloadbalancing:ModifyRule",
                "elasticloadbalancing:ModifyTargetGroupAttributes",
                "elasticloadbalancing:RegisterTargets",
                "elasticloadbalancing:RemoveListenerCertificates",
                "elasticloadbalancing:RemoveTags",
                "elasticloadbalancing:SetRulePriorities",
                "elasticloadbalancing:SetSecurityGroups",
                "elasticloadbalancing:SetWebAcl"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}




resource "aws_iam_policy" "terraform_pike2" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0010",
            "Effect": "Allow",
            "Action": [
                "iam:AddRoleToInstanceProfile",
                "iam:AttachRolePolicy",
                "iam:CreateInstanceProfile",
                "iam:CreatePolicy",
                "iam:CreateRole",
                "iam:CreateServiceLinkedRole",
                "iam:DeleteInstanceProfile",
                "iam:DeletePolicy",
                "iam:DeleteRole",
                "iam:DeleteRolePermissionsBoundary",
                "iam:DetachRolePolicy",
                "iam:GetInstanceProfile",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:GetRole",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListPolicyVersions",
                "iam:ListRolePolicies",
                "iam:PassRole",
                "iam:PutRolePermissionsBoundary",
                "iam:RemoveRoleFromInstanceProfile",
                "iam:TagInstanceProfile",
                "iam:TagPolicy",
                "iam:TagRole",
                "iam:UntagInstanceProfile",
                "iam:UntagPolicy",
                "iam:UntagRole",
                "iam:UpdateRoleDescription"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0011",
            "Effect": "Allow",
            "Action": [
                "lambda:AddPermission",
                "lambda:GetPolicy",
                "lambda:RemovePermission"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0012",
            "Effect": "Allow",
            "Action": [
                "logs:AssociateKmsKey",
                "logs:CreateLogDelivery",
                "logs:CreateLogGroup",
                "logs:DeleteLogGroup",
                "logs:DeleteRetentionPolicy",
                "logs:DescribeLogGroups",
                "logs:DisassociateKmsKey",
                "logs:ListTagsLogGroup",
                "logs:PutRetentionPolicy",
                "logs:TagLogGroup",
                "logs:UntagLogGroup"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0013",
            "Effect": "Allow",
            "Action": [
                "managed-fleets:DeleteAutoScalingGroup",
                "managed-fleets:DeregisterAutoScalingGroup",
                "managed-fleets:Get*",
                "managed-fleets:RegisterAutoScalingGroup",
                "managed-fleets:UpdateAutoScalingGroup"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0014",
            "Effect": "Allow",
            "Action": [
                "rds:AddTagsToResource",
                "rds:CreateDBSubnetGroup",
                "rds:DeleteDBSubnetGroup",
                "rds:DescribeDBSubnetGroups",
                "rds:ListTagsForResource",
                "rds:ModifyDBSubnetGroup",
                "rds:RemoveTagsFromResource"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0015",
            "Effect": "Allow",
            "Action": [
                "redshift:CreateClusterSubnetGroup",
                "redshift:CreateTags",
                "redshift:DeleteClusterSubnetGroup",
                "redshift:DeleteTags",
                "redshift:DescribeClusterSubnetGroups",
                "redshift:ModifyClusterSubnetGroup"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0016",
            "Effect": "Allow",
            "Action": [
                "route53:ChangeResourceRecordSets",
                "route53:GetChange",
                "route53:GetHostedZone",
                "route53:ListResourceRecordSets"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0017",
            "Effect": "Allow",
            "Action": [
                "ssm:Get*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0018",
            "Effect": "Allow",
            "Action": [
                "wafv2:AssociateWebACL",
                "wafv2:DisassociateWebACL",
                "wafv2:GetWebACLForResource"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor0000",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateKeyPair",
                "ec2:CreateLaunchTemplate",
                "ec2:CreateLaunchTemplateVersion",
                "ec2:DeleteKeyPair",
                "ec2:DeleteLaunchTemplate",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeLaunchTemplateVersions",
                "ec2:DescribeLaunchTemplates",
                "ec2:ImportKeyPair"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor001",
            "Effect": "Allow",
            "Action": [
                "iam:AddRoleToInstanceProfile",
                "iam:AttachRolePolicy",
                "iam:CreateInstanceProfile",
                "iam:CreatePolicy",
                "iam:CreateRole",
                "iam:DeleteInstanceProfile",
                "iam:DeletePolicy",
                "iam:DeleteRole",
                "iam:DetachRolePolicy",
                "iam:GetInstanceProfile",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:GetRole",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListPolicies",
                "iam:ListPolicyVersions",
                "iam:ListRolePolicies",
                "iam:PassRole",
                "iam:RemoveRoleFromInstanceProfile",
                "iam:TagInstanceProfile",
                "iam:TagRole",
                "iam:UntagInstanceProfile",
                "iam:UntagRole"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Sid": "VisualEditor002",
            "Effect": "Allow",
            "Action": [
                "ssm:DeleteParameter",
                "ssm:PutParameter"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}


# new swarms deploy permission
resource "aws_iam_policy" "github_ssm_policy" {
  name        = "GitHubSSMPolicy"
  description = "Policy to allow SSM commands for GitHub role"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ssm:SendCommand",
          "ssm:ListCommands",
          "ssm:GetCommandInvocation"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "ec2:DescribeInstances"
        ],
        Resource = "*"
      }
    ]
  })
}

# resource "aws_iam_role_policy_attachment" "attach_github_ssm_policy" {
#   policy_arn = aws_iam_policy.github_ssm_policy.arn
#   role       = "github"  # Ensure this matches your IAM role
# }

# output "policy_arn" {
#   value = aws_iam_policy.github_ssm_policy.arn
# }
