# Automated AKS construction by Terraform

## Dependencies

* Terraform CLI 0.12.0 or later
* Vaild MS Azure account
* Azure CLI 2.13 or later

## How to run

1. [Only once per project] Create a Service Principal and login to your Azure account with it

    ```
    $ az login

    $ az account list
      # Take notes on "id" field in the Azure account where you want to create a resource

    SUBSCRIPTION_ID=${id}

    $ az account set --subscription="${SUBSCRIPTION_ID}"

    $ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${SUBSCRIPTION_ID}"
      # Take notes on "appId", "password", "tenant"

    CLIENT_ID=${appId}
    CLIENT_SECRET=${password}
    TENANT_ID=${tenant}

    $ az login --service-principal -u ${CLIENT_ID} -p ${CLIENT_SECRET} --tenant ${TENANT_ID}

    $ az account show
      # Check if we could login with the newly created account
    ```

    Ref: https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html

2. [Only once per project] Create a Azure Blob Storage (in order to manage Terraform states within Azure)

    1. Create a Azure Storage account from Azure Portal. Arbitrary name / resource group name is fine

    2. In the Azure Portal, move to "Access Key" page for the created Storage account and check the connection string to connect to Azure Storage (Take notes on the value in "Connection string" in "key1").

    3. Create a Blob container

        ```
        CONTAINER_NAME=${arbitrary_name_for_storage_container}
        CONNECTION_STRING="${connection_string_taken_in_2}"

        $ az storage container create -n ${CONTAINER_NAME} --connection-string ${CONNECTION_STRING}

        $ az storage container show -n ${CONTAINER_NAME} --connection-string ${CONNECTION_STRING}
          # Check if the container is created
        ```

3. [Only once per directory] Prepare configurations

    Create the following text files under this directory:

    1. terraform.tfvars

        ```
        subscription_id        = "${subscription_id}"
        client_id              = "${client_id}"
        client_secret          = "${client_secret}"
        tenant_id              = "${tenant_id}"
        resource_group_name    = "${resource_group_name}"
        location               = "${location}"
        cluster_name           = "${cluster_name}"
        dns_preffix            = "${dns_preffix}"
        default_node_pool_name = "${default_node_pool_name}"
        enable_auto_scaling    = "${enable_auto_scaling}"
        vm_size                = "${vm_size}"
        node_count             = "${node_count}
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

4. Run Terraform commands to provision AKS

    ```
    $ terraform init --backend-config=terraform.tfbackend

    $ terraform plan
      # Confirm the execution plan

    $ terraform apply --auto-approve
      # It will output the kubeconfig of created AKS
    ```

    If you no longer need the resource,

    ```
    $ terraform destroy --auto-approve
    ```