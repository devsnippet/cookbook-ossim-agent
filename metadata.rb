name             'ossim-agent'
maintainer       'Fernando Israel García Martínez'
maintainer_email 'figarciamartinez@gmail.com'
license          'All rights reserved'
description      'Installs/Configures ossim-agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.10.0'

# %w{ debian ubuntu centos suse fedora redhat }.each do |os|
# centos suse fedora redhat not tested
%w{ debian ubuntu }.each do |os|
    supports os
end
