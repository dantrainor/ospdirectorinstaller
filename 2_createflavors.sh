source ~/stackrc
nova flavor-delete control
nova flavor-delete compute
nova flavor-delete ceph-storage
nova flavor-delete baremetal

openstack flavor create --id auto --ram 6144 --disk 40 --vcpus 2 control
openstack flavor create --id auto --ram 6144 --disk 50 --vcpus 4 compute
openstack flavor create --id auto --ram 4096 --disk 20 --vcpus 2 ceph-storage
openstack flavor create --id auto --ram 4096 --disk 20 --vcpus 1 baremetal

openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="compute" compute
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="control" control
openstack flavor set --property "cpu_arch"="x86_64" --property "capabilities:boot_option"="local" --property "capabilities:profile"="ceph-storage" ceph-storage
