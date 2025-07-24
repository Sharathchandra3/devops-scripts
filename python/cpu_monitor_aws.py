import boto3
import psutil

# Initialize CloudWatch client
cloudwatch = boto3.client('cloudwatch', region_name='us-east-1')

# Get CPU usage
cpu_usage = psutil.cpu_percent(interval=1)

# Push metric to CloudWatch
response = cloudwatch.put_metric_data(
    Namespace='CustomMetrics',
    MetricData=[
        {
            'MetricName': 'CPUUtilization',
            'Dimensions': [{'Name': 'InstanceType', 'Value': 'CustomScript'}],
            'Unit': 'Percent',
            'Value': cpu_usage
        },
    ]
)

print(f"Sent CPU utilization {cpu_usage}% to CloudWatch")
