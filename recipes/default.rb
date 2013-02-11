#
# Cookbook Name:: ossim-agent
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

geolitecity[:url] = "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
geolitecity[:path] = "/usr/share/geoip"
geolitecity[:file] = "GeoLiteCity.dat"

# packages
%{ git wget python-geoip python-pyinotify python-tz python-nmap python-ldap python-libpcap }.each do |pkg|
    package pkg do
        action :install
    end
end

# OssinAgent need "/usr/share/geoip/GeoLiteCity.dat"
directory "/usr/share/geoip" do
    owner "root"
    group "root"
    mode 00755
    action :create
end

bash "download GeoLiteCity.dat" do
    user "root"
    cwd geolitecity[:path]
    code <<-EOH
        wget -c -t3 #{geolitecity[:url]}
        gunzip #{geolitecity[:file]}.gz
    EOH
end

