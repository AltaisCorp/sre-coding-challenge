package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformS3Notification(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../03-s3-notification",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}
