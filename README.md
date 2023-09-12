# AWS_Terraform_Demo
![Terraform](https://img.shields.io/badge/-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) ![AWS](https://img.shields.io/badge/-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) ![Shell Script](https://img.shields.io/badge/-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) 
[![Azure DevOps Release Pipeline](https://dev.azure.com/your-organization/your-project/_apis/build/status/your-pipeline-name?branchName=main)](https://vsrm.dev.azure.com/DevOpsNxt961/_apis/public/Release/badge/9adb4fbe-b74d-4b2b-b048-09612ac8de25/1/1)  

# Architecture 
![basic_ec2 drawio](https://github.com/yoU-Jay/AWS_Demo/assets/59735375/ee9cfe79-3b1e-4349-aae0-a60e17d3d5e8)


# Prerequisites

### Softwares Required

|  **Name** |
|:---------:|
| Terraform |
|  AWS CLI  |

### Local Setup

**AWS**

* Create an IAM User with necessary permissions.
* Create an Access Key for the above user.

**Create IAM User**

```
aws iam create-user \
--user-name DNxtUser

aws iam create-access-key --user-name DNxtUser

aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess --user-name DNxtUser
```

* Setup a local AWS profile for the above user using `aws configure` and the access keys provided.

  

**Terraform**

* Download terraform from the official Hashicorp website.

* Extract the executable file to any directory.

* Update the Environment variable.

* Verify using `terraform --version`

  

**Git**

* Setup `user.name` and `user.email` at local level using `git configure --local`
* To setup Github authentication using PAT. `git remote set-url origin https://<your_personal_access_token>@github.com/<username>/<repo_name>.git`
