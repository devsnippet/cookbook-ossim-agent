name             'ossim-agent'
maintainer       'Abadasoft'
maintainer_email 'figarciamartinez@gmail.com'
license          'All rights reserved'
description      'Installs/Configures ossim-agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ debian ubuntu centos suse fedora redhat }.each do |os|
    supports os
end

# %w{ apt yum }.each do |dep|
#    depends dep
# end
