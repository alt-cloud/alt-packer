#!/usr/bin/bash

set -euo pipefail

#bt_version="c10f2"
bt_version="11.0"
#bt_version="8sp"
#make image target=alt-server headless=false BASE_VERSION=$bt_version TARGET_VERSION=$bt_version VM_TYPE=cloud
make image target=alt-workstation headless=false BASE_VERSION=$bt_version TARGET_VERSION=$bt_version VM_TYPE=cloud

#bt_version="10.4-vmware"
#vcenter_server="10.4.5.170"
#vsphere_host="10.4.5.171"
#vsphere_user="cloud-builder@vsphere.local"
#vsphere_password="dfH567!?jkVC"
#"cl945#*ES"
#make image target=alt-server headless=false BASE_VERSION=$bt_version TARGET_VERSION=$bt_version VM_TYPE=vsphere VCENTER_SERVER=$vcenter_server VSPHERE_HOST=$vsphere_host VSPHERE_USER=$vsphere_user VSPHERE_PASSWORD=$vsphere_password
