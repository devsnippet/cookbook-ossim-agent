default[:geolitecity][:url] = "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
default[:geolitecity][:path] = "/usr/share/geoip"
default[:geolitecity][:file] = "GeoLiteCity.dat"

#
# release: branch/tag to do for the `git checkout`
#
default[:ossim][:code_from] = "git://git.assembla.com/os-sim.2.git"
default[:ossim][:release] = "release-4.1.3"

#
# server: 
#
default[:ossim][:server] = "127.0.0.1"
default[:ossim][:port] = "40001"

