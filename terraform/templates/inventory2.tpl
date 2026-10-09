[servers]
%{ for name, inst in ubuntu_workers ~}
${name} ansible_host=${inst.public_ip} ansible_user=${inst.user}
%{ endfor ~}
%{ for name, inst in redhat ~}
${name} ansible_host=${inst.public_ip} ansible_user=${inst.user}
%{ endfor ~}
%{ for name, inst in amazon ~}
${name} ansible_host=${inst.public_ip} ansible_user=${inst.user}
%{ endfor ~}

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_private_key_file=${ssh_key_path}
ansible_host_key_checking=false
