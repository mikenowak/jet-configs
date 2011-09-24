#!/sbin/sh
#
# This script installs VMware tools and is executed in the post install
# phase of JET run.
# 
# It also enables time synchronisation between the host and guest.
#
VMINSTDIR=/var/tmp

# Uncompress the VM tools tarball
cd ${VMINSTDIR}
gunzip < vmware-solaris-tools.tar.gz | tar xf -

# Run the installation script accepting default options
${VMINSTDIR}/vmware-tools-distrib/vmware-install.pl -d

# Cleanup after installation
rm -fr ${VMINSTDIR}/vmware-tools-distrib ${VMINSTDIR}/vmware-solaris-tools.tar.gz

# Enable Time Synchornization between the ESXi host and this VM Guest
/usr/bin/vmware-toolbox-cmd timesync enable
