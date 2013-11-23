#!/bin/bash -eux
yum -y clean all
if [ $VM_TOOLS != 'disable' ]; then
  rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?
fi
rm -f /tmp/chef*rpm

# clean up redhat interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules
sed -i 's/^HWADDR.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i 's/^UUID.*$//' /etc/sysconfig/network-scripts/ifcfg-eth0
