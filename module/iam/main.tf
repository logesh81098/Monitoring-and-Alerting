##############################################################################################################################
#                                                IAM Role
##############################################################################################################################

resource "aws_iam_role" "monitoring-alerting-iam-role" {
  name = "Monitoring-and-Alerting-IAM-Role"
  description = "IAM Role for Monitoring and Alerting Server"
  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            }
        }
    ]
  }
  EOF
  tags = {
    Name = "Monitoring-and-Alerting-IAM-Role"
    IAC = "Terraform"
  }
}


##############################################################################################################################
#                                                IAM Policy
##############################################################################################################################

#[Note:Grafana collects metrics from AWS Cloud using AWS API in CloudWatch]


resource "aws_iam_policy" "monitoring-alerting-iam-policy" {
  name = "Monitoring-and-Alerting-IAM-Policy"
  description = "IAM Policy for Monitoring and Alerting server to grap CPU, Memory Utilizations from multiple servers"
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "ReadCloudWatchLogMetrics",
            "Effect": "Allow",
            "Action": [
                "cloudwatch:GetMetricData",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:ListMetrics",
                "cloudwatch:DescribeAlarms",
                "cloudwatch:DescribeAlarmHistory"
            ],
            "Resource": "*"
        },
        {
            "Sid": "DiscoverEC2Instances",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeInstances",
                "ec2:DescribeRegions",
                "ec2:DescribeTags",
                "ec2:DescribeVolumes"

            ],
            "Resource": "*"
        }
    ]
  }
  EOF
  tags = {
    Name = "Monitoring-and-Alerting-IAM-Policy"
    IAC = "Terraform"
  }
}