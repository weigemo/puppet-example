#!/bin/bash
. ./func.inc.sh

echo "Please choose the role of this machine"
options="Puppet-Master  Puppet-Client"
select opt in ${options}; do
	if [[ "${opt}" = "Puppet-Master" || "${opt}" = "Puppet-Client" ]]; then
		prepare_yum_repo || exit
		if [ "${opt}" = "Puppet-Master" ]; then
			install_master;
			exit
		elif [ "${opt}" = "Puppet-Client" ]; then
			install_client;
			exit
		fi
	else
		echo "Bad option, please choose again"
	fi
done
