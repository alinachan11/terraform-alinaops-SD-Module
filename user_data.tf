

locals {

sd-userdata = <<USERDATA
#!/bin/bash 
chmod 600 /home/ubuntu/${var.keypath}
mv /home/ubuntu/${var.keypath} /home/ubuntu/.ssh/

echo "end of user data - sd"
USERDATA

}

