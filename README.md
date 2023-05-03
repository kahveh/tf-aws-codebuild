# tf-aws-codebuild

# AWS CodeBuild and ECR Integration

This Terraform configuration sets up an AWS CodeBuild project that builds Docker images and pushes them to the specified ECR repository. Optionally, it can also configure a CloudWatch Event Rule to trigger the build periodically (nightly).

## Variables

| Variable             | Type  | Description                                                               | Default Value                                   |
|----------------------|-------|---------------------------------------------------------------------------|-------------------------------------------------|
| ecr_arn              | string | The ARN of the existing ECR repository where Docker images will be pushed | ""                                              |
| image_tag            | string | The tag for the Docker images                                             | "latest"                                        |
| build_periodically   | bool   | If true, the build will be triggered nightly using a CloudWatch Event     | false                                           |
| source_repository    | string | The URL of the Git repository containing the Dockerfile                   |  |

## Usage

1. Set the required variables in a `terraform.tfvars` file or through environment variables.
2. Initialize Terraform:

   ```
   terraform init
   ```

3. Run a Terraform plan to verify the configuration:

   ```
   terraform plan
   ```

4. Apply the Terraform configuration:

   ```
   terraform apply
   ```

5. To destroy the resources created by this configuration, run:

   ```
   terraform destroy
   ```