## Quick Start ##

Enable debugging on Linux:
``` sh
export TF_LOG="DEBUG"
```

Enable debugging for PowerShell:
``` sh
$env:TF_LOG="DEBUG"
```

How to deploy?
``` powershell
cd .\tf\applications\infra-app\
terraform init
terraform plan
terraform apply
```

# Issues
`Error: Unable to inspect volume: Error: No such volume: prometheus-data`
sol: `terraform state rm docker_volume.grafana-data` `terraform state rm docker_volume.prometheus-data`