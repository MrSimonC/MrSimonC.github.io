# Azure Functions local settings

I really like Azure functions, and have championed them at my work.

However, when it comes time to revisit a project which has them, it may be hard to recreate the `local.settings.json` file. 

Your local.settings.json file and will eventually disappear as it is not in source control – and is usually a good idea not to keep it in source control. However, when you need to get it back in order to continue your development work, it is actually possible to do this via the command line. Make sure you have installed the Azure CLI.

Here we go:

```bash
az login

func init MyFunctionApp

func azure functionapp fetch-app-settings MyFunctionApp

# the above will download encrypted, which makes it hard to work with. Decrypt with

func settings decrypt local.settings.json

# you can also get any  storage strings

func azure storage fetch-connection-string <StorageAccountName>
```