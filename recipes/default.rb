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
%w{ git wget python-geoip python-pyinotify python-tz python-nmap python-ldap python-libpcap }.each do |pkg|
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


# ossim source code
git "/tmp/tmp-siem" do
    repository "#{node[:ossim][:code_from]}"
    reference "#{node[:ossim][:release]}"
    action :sync
end
