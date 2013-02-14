# ossim-agent cookbook
# recipe: configuration
#
# This recipe is used to config ossim-agent
#
# TODO:
#   * Plugin list
#   * Rest of agent configuration
#   * ¿ start/stop service script ?


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
