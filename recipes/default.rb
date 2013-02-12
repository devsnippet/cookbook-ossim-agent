#
# Cookbook Name:: ossim-agent
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
# packages
%w{ git wget python-geoip python-pyinotify python-tz python-nmap python-ldap python-libpcap python-adodb python-mysqldb python-paramiko python-pymssql }.each do |pkg|
    package pkg do
        action :install
    end
end

# OssinAgent need "/usr/share/geoip/GeoLiteCity.dat"
directory "#{node[:geolitecity][:path]}" do
    owner "root"
    group "root"
    mode 00755
    action :create
end

bash "download GeoLiteCity.dat" do
    user "root"
    cwd "#{node[:geolitecity][:path]}"
    code <<-EOH
        if [[ ! -f #{node[:geolitecity][:path]}/GeoLiteCity.dat ]]
        then
            wget -c -t3 #{node[:geolitecity][:url]}
            gunzip #{node[:geolitecity][:file]}.gz
        fi

    EOH
end

#
# ossim source code
#
# git "#{node[:ossim][:tempdir]}" do
git "/tmp/temp-siem" do
    repository "#{node[:ossim][:code_from]}"
    reference "#{node[:ossim][:release]}"
    action :sync
end

#
# install 
#
bash "install ossim agent" do
    user "root"
    # cwd "#{node[:ossim][:tempdir]}"
    cwd "/tmp/temp-siem/os-sim/agent"
    code <<-EOH
        set -x
        python setup.py build
        python setup.py install
        set +x
    EOH
end

#
# Config 
#
template "/etc/ossim/agent/config.cfg" do
    source "config.cfg.erb"
    mode 0440
    owner "root"
    group "root"
    variables({
        :server => node[:ossim][:server],
        :server_port => node[:ossim][:port]
    })
end
