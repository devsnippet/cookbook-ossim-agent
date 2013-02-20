# ossim-agent cookbook
# recipe: configuration
#
# This recipe is used to config ossim-agent
#
# TODO:
#   * ¿ start/stop service script ?

include_recipe "ossim-agent"

template "/etc/ossim/agent/config.cfg" do
    source "config.cfg.erb"
    mode 0440
    owner "root"
    group "root"
end
