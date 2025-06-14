provider "aws" { 
    region="us-west-2"
}
resource "aws_s3_bucket" {
    bucket="terraform_eks_state_bucket"

    lifecycle{
        prevent_destroy=false

    }
}

resource "aws_dynamodb_table" "basic-dynamodb-table"{
    name="terraform-eks-state-locks"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "LockId"
    
    attribute {
    name = "UserId"
    type = "S"
  }
}



