# AWS Cloud Cost Optimization - Identifying Stale EBS Snapshots

## Overview

This AWS Lambda function helps optimize your AWS costs by identifying and deleting stale EBS snapshots that are no longer associated with any active EC2 instances. By removing these unnecessary snapshots, you can save on storage costs.

## How It Works

The Lambda function performs the following steps:

1. **Fetch All EBS Snapshots**: Retrieves a list of all EBS snapshots owned by your AWS account.
2. **Retrieve Active EC2 Instances**: Retrieves a list of all active EC2 instances (both running and stopped).
3. **Check Snapshots Against Active Volumes**: Checks if each snapshot's associated EBS volume is attached to any active EC2 instances.
4. **Delete Stale Snapshots**: Deletes snapshots whose volumes are not attached to any active EC2 instances.

## Example

Let's assume you have the following snapshots and EC2 instances:

- **Snapshots**:
  - Snapshot 1: Volume A
  - Snapshot 2: Volume B
  - Snapshot 3: Volume C

- **EC2 Instances**:
  - Instance 1: Attached to Volume A (Running)
  - Instance 2: Attached to Volume D (Stopped)

### Execution:

1. **Fetch Snapshots**: Lambda retrieves Snapshot 1, Snapshot 2, and Snapshot 3.
2. **Fetch Active EC2 Instances**: Lambda retrieves Instance 1 (Running, Volume A) and Instance 2 (Stopped, Volume D).
3. **Check Snapshots**:
   - Snapshot 1 (Volume A) is associated with an active instance (Instance 1).
   - Snapshot 2 (Volume B) is not associated with any active instance.
   - Snapshot 3 (Volume C) is not associated with any active instance.
4. **Delete Stale Snapshots**: Lambda deletes Snapshot 2 and Snapshot 3 because their volumes (B and C) are not attached to any active EC2 instances.

## Prerequisites

- AWS account with permissions to manage EC2 instances and EBS snapshots.
- AWS Lambda and IAM roles set up with appropriate permissions.

## Deployment

1. **Create IAM Role**:
   - Create an IAM role with the following permissions:
     - `ec2:DescribeSnapshots`
     - `ec2:DescribeInstances`
     - `ec2:DeleteSnapshot`
   - Attach this IAM role to your Lambda function.

2. **Create Lambda Function**:
   - Go to the AWS Lambda Console.
   - Create a new Lambda function.
   - Set the runtime to Python 3.x.
   - Attach the IAM role created in step 1 to the Lambda function.
   - Copy and paste the following code into the Lambda function editor: (python code)

3. **Test Lambda Function**:
   - Create a test event in the Lambda console.
   - Execute the test to ensure the function runs correctly and deletes stale snapshots.



