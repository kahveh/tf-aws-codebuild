# tf-aws-codebuild

# AWS CodeBuild and ECR Integration

This Terraform configuration sets up an AWS CodeBuild project that builds a project and configures codebuild permissions
to push to an optional ECR repository. It can also configure a CloudWatch Event Rule to trigger the build periodically (
nightly).

## Variables

|           Variable            |                         Description                         |      Type      |                       Default                        |
|:-----------------------------:|:-----------------------------------------------------------:|:--------------:|:----------------------------------------------------:|
|      `source_repository`      |                  (no description provided)                  |    `string`    |                         N/A                          |
|          `ecr_name`           |                     ECR repository name                     |    `string`    |                         `""`                         |
|            `name`             |                  (no description provided)                  |    `string`    |                         `""`                         |
|       `create_webhook`        |                  (no description provided)                  |     `bool`     |                        `true`                        |
|          `base_refs`          |                List of ECR repository names                 | `list(string)` |                         `[]`                         |
|     `build_periodically`      |                  (no description provided)                  |     `bool`     |                       `false`                        |
|    `environment_variables`    |   Map of environment variables for the CodeBuild project    | `map(string)`  |                         `{}`                         |
|         `description`         |            Description for the CodeBuild project            |    `string`    |   `"Builds Docker images and pushes them to ECR"`    |
|        `build_timeout`        |           Build timeout for the CodeBuild project           |    `string`    |                        `"20"`                        |
|        `artifact_type`        |         Type of artifacts for the CodeBuild project         |    `string`    |                   `"NO_ARTIFACTS"`                   |
|  `environment_compute_type`   |     Compute type for the CodeBuild project environment      |    `string`    |               `"BUILD_GENERAL1_SMALL"`               |
|      `environment_image`      |     Docker image for the CodeBuild project environment      |    `string`    |            `"aws/codebuild/standard:5.0"`            |
|      `environment_type`       |        Type of environment for the CodeBuild project        |    `string`    |                 `"LINUX_CONTAINER"`                  |
| `image_pull_credentials_type` |    Image pull credentials type for the CodeBuild project    |    `string`    |                    `"CODEBUILD"`                     |
|       `privileged_mode`       | Whether to enable privileged mode for the CodeBuild project |     `bool`     |                        `true`                        |
|         `cache_type`          |            Cache type for the CodeBuild project             |    `string`    |                      `"LOCAL"`                       |
|         `cache_modes`         |            Cache modes for the CodeBuild project            | `list(string)` | `["LOCAL_DOCKER_LAYER_CACHE", "LOCAL_SOURCE_CACHE"]` |
|         `source_type`         |            Source type for the CodeBuild project            |    `string`    |                      `"GITHUB"`                      |
|       `git_clone_depth`       |          Git clone depth for the CodeBuild project          |    `number`    |                         `1`                          |
|     `report_build_status`     |  Whether to report build status for the CodeBuild project   |     `bool`     |                        `true`                        |

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