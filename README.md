# AWS_Terraform_Demo
![Terraform](https://img.shields.io/badge/-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) ![AWS](https://img.shields.io/badge/-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) ![Shell Script](https://img.shields.io/badge/-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white) 

##### This is a demo repo to demonstrate skills of DevOps tools like AWS, Terraform, Azure DevOps pipelines (and many more to come..).  
*🚧Work in Progress..🚧*  

| Build Pipeline | Release Pipeline |
| ---- | ---- |
| [![Build Status](https://dev.azure.com/DevOpsNxt961/Nxt/_apis/build/status%2FNxt-CI?branchName=basic_ec2)](https://dev.azure.com/DevOpsNxt961/Nxt/_build/latest?definitionId=1&branchName=basic_ec2) | [![Azure DevOps Release Pipeline](https://vsrm.dev.azure.com/DevOpsNxt961/_apis/public/Release/badge/9adb4fbe-b74d-4b2b-b048-09612ac8de25/1/1?api-version=6.0)](https://dev.azure.com/DevOpsNxt961/Nxt/_release?definitionId=9adb4fbe-b74d-4b2b-b048-09612ac8de25&_a=releases) |
# Architecture 
![alb diagram](https://github.com/yoU-Jay/AWS_Demo/assets/59735375/e70aec36-870f-401c-a5bd-d6028a011210)



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

# Azure DevOps Pipelines
### Prerequisites
* Existing ADO Project with required permissions.
* Service connections for S3 and Github.
* configured agent
* Installed terraform extention in ADO

### Deployment
* Create a `+ New` pipeline in releases.
* Start with an `Empty job`.
* In `+ Add and artifact`, Select `Source type` as `Github`.
* Under `Service` choose the *service connection name* created for Github and under `Source (repository)` select the required repository.
* Click on `Add`.
* In Stage 1, click on `1 job, 0 task` to configure the stage.
* Configure the `Agent job`
* Select the Agent from the Agent Pool
* Create 4 terraform tasks
