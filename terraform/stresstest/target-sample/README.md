# Automated Azure VM construction by Terraform

## Dependencies

* Terraform CLI 0.12.0 or later
* Vaild MS Azure account
* Azure CLI 2.13 or later

## How to run

1. [Only once per directory] Prepare configurations

    Create the following text files under this directory:

    1. terraform.tfvars

        ```
        subscription_id             = "${subscription_id}"
        client_id                   = "${client_id}"
        client_secret               = "${client_secret}"
        tenant_id                   = "${tenant_id}"
        resource_group_name         = "${resource_group_name}"
        location                    = "${location}"
        vnet_name                   = "${vnet_name}"
        vnet_address_space          = "${vnet_address_space}"
        subnet_name                 = "${subnet_name}"
        subnet_address_prefixes     = "${subnet_address_prefixes}"
        public_ip_name              = "${public_ip_name}"
        public_ip_allocation_method = "${public_ip_allocation_method}
        network_security_group_name = "${network_security_group_name}"
        nic_name                    = "${nic_name}"
        nic_ip_configuration_name   = "${nic_ip_configuration_name}"
        ```

        Note that `resource_group_name` must be different between every Terraform script. Otherwise a conflict will happen when more than one script tries to create the same resource group.

    2. terraform.tfbackend

        ```
        resource_group_name  = "${resource_group_name}"
        storage_account_name = "${storage_account_name}"
        container_name       = "${container_name}"
        key                  = "${key}"
        ```

        Note that the place where it stores tfstate must be different between every Terraform script. Otherwise the terraform will understand its state improperly.

4. Run Terraform commands to provision Azure VM

    ```
    $ terraform init --backend-config=terraform.tfbackend

    $ terraform plan
      # Confirm the execution plan

    $ terraform apply --auto-approve
      # It will output the public IP and the private key to connect to the VM
    ```

    If you no longer need the resource,

    ```
    $ terraform destroy --auto-approve
    ```