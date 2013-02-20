#
# http://dev.maxmind.com/geoip/geolite
# free IP geolocation databases
#
default[:geolitecity][:url] = "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
default[:geolitecity][:path] = "/usr/share/geoip"
default[:geolitecity][:file] = "GeoLiteCity.dat"

#
# release: branch/tag to do for the `git checkout`
#
default[:ossim][:src][:code_from] = "git://git.assembla.com/os-sim.2.git"
default[:ossim][:src][:release] = "release-4.1.3"

#
# server 
#
default[:ossim][:server][:ip] = "127.0.0.1"
default[:ossim][:server][:port] = "40001"

#
# Framework
#
default[:ossim][:control_framework] = "False"
default[:ossim][:frameworkd][:server_ip] = "127.0.0.1"
default[:ossim][:frameworkd][:server_port] = "40003"


#
# Daemon
# 
default[:ossim][:daemon][:enable] = "True"
default[:ossim][:daemon][:pid] = "/var/run/ossim-agent.pid"


#
# log
#
default[:ossim][:log][:path] = "/var/log/ossim"
default[:ossim][:log][:file] = "#{node[:ossim][:log][:path]}/agent.log"
default[:ossim][:log][:error] = "#{node[:ossim][:log][:path]}/agent_error.log"
default[:ossim][:log][:stats] = "#{node[:ossim][:log][:path]}/agent_stats.log"



#
# default values for plugins
#
default[:ossim][:plugin_defauls][:sensor] = node[:ipaddress]
default[:ossim][:plugin_defauls][:interface] = node[:network][:default_interface]
#
# FIXME: This is the connect string to ossim database, it has to change when we deploy 
#        a full ossim infraestructure
default[:ossim][:plugin_defauls][:dsn] = "mysql:localhost:ossim:root:yoursecretpassword"
default[:ossim][:plugin_defauls][:tzone] = "Europe/Madrid"

#
# Plugins
#
# detectors
#
default[:ossim][:plugins]["apache"] = { :enable => false, :path => "/etc/ossim/agent/plugins/apache.cfg" } 
default[:ossim][:plugins]["arpwatch"] = { :enable => false, :path => "/etc/ossim/agent/plugins/arpwatch.cfg" } 
default[:ossim][:plugins]["cisco-ids"] = { :enable => false, :path => "/etc/ossim/agent/plugins/cisco-ids.cfg" } 
default[:ossim][:plugins]["cisco-pix"] = { :enable => false, :path => "/etc/ossim/agent/plugins/cisco-pix.cfg" } 
default[:ossim][:plugins]["cisco-router"] = { :enable => false, :path => "/etc/ossim/agent/plugins/cisco-router.cfg" } 
default[:ossim][:plugins]["cisco-vpn"] = { :enable => false, :path => "/etc/ossim/agent/plugins/cisco-vpn.cfg" } 
default[:ossim][:plugins]["cisco-ips"] = { :enable => false, :path => "/etc/ossim/agent/plugins/cisco-ips.cfg" } 
default[:ossim][:plugins]["clamav"] = { :enable => false, :path => "/etc/ossim/agent/plugins/clamav.cfg" } 
default[:ossim][:plugins]["clurgmgr"] = { :enable => false, :path => "/etc/ossim/agent/plugins/clurgmgr.cfg" } 
default[:ossim][:plugins]["fw1ngr60"] = { :enable => false, :path => "/etc/ossim/agent/plugins/fw1ngr60.cfg" } 
default[:ossim][:plugins]["gfi"] = { :enable => false, :path => "/etc/ossim/agent/plugins/gfi.cfg" } 
default[:ossim][:plugins]["heartbeat"] = { :enable => false, :path => "/etc/ossim/agent/plugins/heartbeat.cfg" } 
default[:ossim][:plugins]["iis"] = { :enable => false, :path => "/etc/ossim/agent/plugins/iis.cfg" } 
default[:ossim][:plugins]["intrushield"] = { :enable => false, :path => "/etc/ossim/agent/plugins/intrushield.cfg" } 
default[:ossim][:plugins]["iphone"] = { :enable => false, :path => "/etc/ossim/agent/plugins/iphone.cfg" } 
default[:ossim][:plugins]["iptables"] = { :enable => false, :path => "/etc/ossim/agent/plugins/iptables.cfg" } 
default[:ossim][:plugins]["kismet"] = { :enable => false, :path => "/etc/ossim/agent/plugins/kismet.cfg" } 
default[:ossim][:plugins]["mwcollect"] = { :enable => false, :path => "/etc/ossim/agent/plugins/mwcollect.cfg" } 
default[:ossim][:plugins]["nagios"] = { :enable => false, :path => "/etc/ossim/agent/plugins/nagios.cfg" } 
default[:ossim][:plugins]["netgear"] = { :enable => false, :path => "/etc/ossim/agent/plugins/netgear.cfg" } 
default[:ossim][:plugins]["netscreen-manager"] = { :enable => false, :path => "/etc/ossim/agent/plugins/netscreen-manager.cfg" } 
default[:ossim][:plugins]["netscreen-nsm"] = { :enable => false, :path => "/etc/ossim/agent/plugins/netscreen-nsm.cfg" } 
default[:ossim][:plugins]["netscreen-firewall"] = { :enable => false, :path => "/etc/ossim/agent/plugins/netscreen-firewall.cfg" } 
default[:ossim][:plugins]["ntsyslog"] = { :enable => false, :path => "/etc/ossim/agent/plugins/ntsyslog.cfg" } 
default[:ossim][:plugins]["osiris"] = { :enable => false, :path => "/etc/ossim/agent/plugins/osiris.cfg" } 
default[:ossim][:plugins]["ossec"] = { :enable => false, :path => "/etc/ossim/agent/plugins/ossec.cfg" } 
default[:ossim][:plugins]["ossim-agent"] = { :enable => false, :path => "/etc/ossim/agent/plugins/ossim-agent.cfg" } 
default[:ossim][:plugins]["p0f"] = { :enable => false, :path => "/etc/ossim/agent/plugins/p0f.cfg" } 
default[:ossim][:plugins]["pads"] = { :enable => false, :path => "/etc/ossim/agent/plugins/pads.cfg" } 
default[:ossim][:plugins]["pam_unix"] = { :enable => false, :path => "/etc/ossim/agent/plugins/pam_unix.cfg" } 
default[:ossim][:plugins]["postfix"] = { :enable => false, :path => "/etc/ossim/agent/plugins/postfix.cfg" } 
default[:ossim][:plugins]["radiator"] = { :enable => false, :path => "/etc/ossim/agent/plugins/radiator.cfg" } 
default[:ossim][:plugins]["realsecure"] = { :enable => false, :path => "/etc/ossim/agent/plugins/realsecure.cfg" } 
default[:ossim][:plugins]["rrd"] = { :enable => false, :path => "/etc/ossim/agent/plugins/rrd.cfg" } 
default[:ossim][:plugins]["snortunified"] = { :enable => false, :path => "/etc/ossim/agent/plugins/snortunified.cfg" } 
default[:ossim][:plugins]["spamassassin"] = { :enable => false, :path => "/etc/ossim/agent/plugins/spamassassin.cfg" } 
default[:ossim][:plugins]["squid"] = { :enable => false, :path => "/etc/ossim/agent/plugins/squid.cfg" } 
default[:ossim][:plugins]["symantec-ams"] = { :enable => false, :path => "/etc/ossim/agent/plugins/symantec-ams.cfg" } 
default[:ossim][:plugins]["ssh"] = { :enable => false, :path => "/etc/ossim/agent/plugins/ssh.cfg" } 
default[:ossim][:plugins]["stonegate"] = { :enable => false, :path => "/etc/ossim/agent/plugins/stonegate.cfg" } 
default[:ossim][:plugins]["sudo"] = { :enable => false, :path => "/etc/ossim/agent/plugins/sudo.cfg" } 
default[:ossim][:plugins]["syslog"] = { :enable => false, :path => "/etc/ossim/agent/plugins/syslog.cfg" } 
default[:ossim][:plugins]["snare"] = { :enable => false, :path => "/etc/ossim/agent/plugins/snare.cfg" } 
default[:ossim][:plugins]["tarantella"] = { :enable => false, :path => "/etc/ossim/agent/plugins/tarantella.cfg" } 
default[:ossim][:plugins]["fidelis"] = { :enable => false, :path => "/etc/ossim/agent/plugins/fidelis.cfg" } 
default[:ossim][:plugins]["rsa-secureid"] = { :enable => false, :path => "/etc/ossim/agent/plugins/rsa-secureid.cfg" } 
default[:ossim][:plugins]["cisco-acs"] = { :enable => false, :path => "/etc/ossim/agent/plugins/cisco-acs.cfg" } 
default[:ossim][:plugins]["fortiguard"] = { :enable => false, :path => "/etc/ossim/agent/plugins/fortiguard.cfg" } 

# monitors
#
default[:ossim][:plugins]["wmi-monitor"] = { :enable => false, :path => "/etc/ossim/agent/plugins/wmi-monitor.cfg" } 
default[:ossim][:plugins]["nmap"] = { :enable => false, :path => "/etc/ossim/agent/plugins/nmap-monitor.cfg" } 
default[:ossim][:plugins]["ntop"] = { :enable => false, :path => "/etc/ossim/agent/plugins/session-monitor.cfg" } 
default[:ossim][:plugins]["opennms"] = { :enable => false, :path => "/etc/ossim/agent/plugins/opennms-monitor.cfg" } 
default[:ossim][:plugins]["ossim-ca"] = { :enable => false, :path => "/etc/ossim/agent/plugins/ossim-monitor.cfg" } 
default[:ossim][:plugins]["ping"] = { :enable => false, :path => "/etc/ossim/agent/plugins/ping-monitor.cfg" } 
default[:ossim][:plugins]["tcptrack"] = { :enable => false, :path => "/etc/ossim/agent/plugins/tcptrack-monitor.cfg" } 
default[:ossim][:plugins]["nessus"] = { :enable => false, :path => "/etc/ossim/agent/plugins/nessus-monitor.cfg" } 
default[:ossim][:plugins]["whois"] = { :enable => false, :path => "/etc/ossim/agent/plugins/whois-monitor.cfg" } 
default[:ossim][:plugins]["malwaredomainlist"] = { :enable => false, :path => "/etc/ossim/agent/plugins/malwaredomainlist.cfg" } 
