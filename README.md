ossim-agent Cookbook
====================

This cookbook install and config ossim-agent.

Requirements
------------

#### Platform

We tested in ubuntu 12.04 server and debian 7.0.

#### Packges

- `git`: To download the source code.
- `wget`: To get _GeoLiteCity.dat.gz_ from http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
- *python libs*: All of them are necessary to _ossim-agent_

```
python-tz
python-pyinotify
python-adodb
python-mysqldb
python-paramiko
python-pymssql
python-libpcap
python-geoip
python-nmap
python-ldap
```

Attributes
----------

All attributes are described in _attributes/default.rb_ they have default values, and you can to change any. The actual version of _cookbook_ has many posibilities:

_*geolitecity*_: 
* `node[:geolitecity][:url]`
* `node[:geolitecity][:path]`
* `node[:geolitecity][:file]`

_*ossim-agent source code*_:
* `node[:ossim][:src][:code_from]`: URL of _git_ repository.
* `node[:ossim][:src][:release]`: _branch_ or _tag_ to use.

_*ossim-agent config.cfg*_:
* `node[:ossim][:server][:ip]`: _ossim-server_ ip, by default _127.0.0.1_.
* `node[:ossim][:server][:port]`: _ossim-server_ port, by defaul _40001_.
* `node[:ossim][:control_framework]`: in _False_ by default.
* `node[:ossim][:frameworkd][:server_ip]`: _framework-server_ ip.
* `node[:ossim][:frameworkd][:server_port]`: _framework-server_ port.
* `node[:ossim][:daemon][:enable]`: It indicates if the agent runs in daemon mode.
* `node[:ossim][:daemon][:pid]`: The path of _pid file_.
* `node[:ossim][:log][:path]`: Path where the _log files_ are saved.
* `node[:ossim][:log][:file]`: _log file_ name.
* `node[:ossim][:log][:error]`: _error log file_ name.
* `node[:ossim][:log][:stats]`: _stats log file_ name.
* `node[:ossim][:plugin_defauls][:sensor]`: Sensor ip, by default _host ip_.
* `node[:ossim][:plugin_defauls][:interface]`: Sensor interface, by default _node default-interface_
* `node[:ossim][:plugin_defauls][:dsn]`: Ossim database default string connect. Its structure is, `<provider>:<database host>:<database name>:<database user>:<password>`, e.g. `mysql:localhost:ossim:root:yoursecretpassword`.
* `node[:ossim][:plugin_defauls][:tzone]`: Time zone, by default _Europe/Madrid_

#### Plugins

Here it is the complete list of plugins that this _cookbook_ managements.

* `node[:ossim][:plugins]["apache"]`
* `node[:ossim][:plugins]["arpwatch"]`
* `node[:ossim][:plugins]["cisco-ids"]`
* `node[:ossim][:plugins]["cisco-pix"]`
* `node[:ossim][:plugins]["cisco-router"]`
* `node[:ossim][:plugins]["cisco-vpn"]`
* `node[:ossim][:plugins]["cisco-ips"]`
* `node[:ossim][:plugins]["clamav"]`
* `node[:ossim][:plugins]["clurgmgr"]`
* `node[:ossim][:plugins]["fw1ngr60"]`
* `node[:ossim][:plugins]["gfi"]`
* `node[:ossim][:plugins]["heartbeat"]`
* `node[:ossim][:plugins]["iis"]`
* `node[:ossim][:plugins]["intrushield"]`
* `node[:ossim][:plugins]["iphone"]`
* `node[:ossim][:plugins]["iptables"]`
* `node[:ossim][:plugins]["kismet"]`
* `node[:ossim][:plugins]["mwcollect"]`
* `node[:ossim][:plugins]["nagios"]`
* `node[:ossim][:plugins]["netgear"]`
* `node[:ossim][:plugins]["netscreen-manager"]`
* `node[:ossim][:plugins]["netscreen-nsm"]`
* `node[:ossim][:plugins]["netscreen-firewall"]`
* `node[:ossim][:plugins]["ntsyslog"]`
* `node[:ossim][:plugins]["osiris"]`
* `node[:ossim][:plugins]["ossec"]`
* `node[:ossim][:plugins]["ossim-agent"]`
* `node[:ossim][:plugins]["p0f"]`
* `node[:ossim][:plugins]["pads"]`
* `node[:ossim][:plugins]["pam_unix"]`
* `node[:ossim][:plugins]["postfix"]`
* `node[:ossim][:plugins]["radiator"]`
* `node[:ossim][:plugins]["realsecure"]`
* `node[:ossim][:plugins]["rrd"]`
* `node[:ossim][:plugins]["snortunified"]`
* `node[:ossim][:plugins]["spamassassin"]`
* `node[:ossim][:plugins]["squid"]`
* `node[:ossim][:plugins]["symantec-ams"]`
* `node[:ossim][:plugins]["ssh"]`
* `node[:ossim][:plugins]["stonegate"]`
* `node[:ossim][:plugins]["sudo"]`
* `node[:ossim][:plugins]["syslog"]`
* `node[:ossim][:plugins]["snare"]`
* `node[:ossim][:plugins]["tarantella"]`
* `node[:ossim][:plugins]["fidelis"]`
* `node[:ossim][:plugins]["rsa-secureid"]`
* `node[:ossim][:plugins]["cisco-acs"]`
* `node[:ossim][:plugins]["fortiguard"]`
* `node[:ossim][:plugins]["wmi-monitor"]`
* `node[:ossim][:plugins]["nmap"]`
* `node[:ossim][:plugins]["ntop"]`
* `node[:ossim][:plugins]["opennms"]`
* `node[:ossim][:plugins]["ossim-ca"]`
* `node[:ossim][:plugins]["ping"]`
* `node[:ossim][:plugins]["tcptrack"]`
* `node[:ossim][:plugins]["nessus"]`
* `node[:ossim][:plugins]["whois"]`
* `node[:ossim][:plugins]["malwaredomainlist"]`

All of them are deactivated by default, you must activate those you want to use.

Recipes
=======

default
-------

Install the packages requires for _ossim-agent_, then download and build and install ossim-agent, this recipe leave the configuration by default.

configuration
--------------

Includes `recipe[ossim-agent]`.

This recipe is used to configure `/etc/ossim/agent/config.cfg`, if you don't use it, your _ossim-agent_ will have the default config to _sever & port_, _plugins_, etc.


Usage
=====

If you only use `recipe[ossim-agent]`, you will get one funcional _ossim-agent_ with all _configs_ by default. Although, we recoment to use `recipe[ossim-agent::configuration]` to management the _plugins_ and _ossim server ip_ conenction.

See __Example__


Example
-------

Here you can to see how you have to enable any plugin and to change one default, in this case it activates the _ssh_ and _syslog_ plugins, and it changes _ossim-server_ address too.

```json
{
  "name": "ossim-agent-prueba",
  "description": "",
  "json_class": "Chef::Role",
  "default_attributes": {
  },
  "override_attributes": {
    "ossim": {
      "plugins": {
        "ssh": {
          "enable": true
        },
        "syslog": {
          "enable": true
        }
      },
      "server": {
        "ip": "192.168.1.13"
      }
    }
  },
  "chef_type": "role",
  "run_list": [
    "recipe[ossim-agent]",
    "recipe[ossim-agent::configuration]"
  ],
  "env_run_lists": {
  }
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Fernando Israel García Martínez ( figarciamartinez@gmail.com )

License: _Creative Commons_

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/es/deed.es"><img alt="Licencia Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/es/80x15.png" /></a><br />Este obra está bajo una <a rel="license" href="http://creativecommons.org/licenses/by/3.0/es/deed.es">Licencia Creative Commons Atribución 3.0 España</a>.

