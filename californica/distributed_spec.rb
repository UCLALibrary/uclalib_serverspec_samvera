require_relative '../spec_helper'

#TODO: use properties instead of these environment variables, whenever I can
# be bothered to figure out how
ENV['REMOTE-SOLR-HOST'] = 'p-u-californicasolr01.library.ucla.edu'
ENV['REMOTE-SOLR-CORE-NAME'] = 'calursus'
ENV['REMOTE-DB-HOST'] = 'p-d-mysqlmaster01.library.ucla.edu'

ENV['REMOTE-DB-USER-NAME'] = 'califproduser'
ENV['REMOTE-FEDORA-HOST'] = 'p-u-californicafedora01.library.ucla.edu'

ENV['REMOTE-IIIF-HOST'] = 'p-u-cantaloupe01.library.ucla.edu'

describe 'californica-prod--distributed' do
    # include all the shared_examples
    include_examples 'remote-db::init'
    include_examples 'remote-fedora::init'
    include_examples 'remote-solr::init'
    include_examples 'remote-iiif::init'
    include_examples 'redis::init'
    include_examples 'proxy::init'
    include_examples 'railsapp::init'
    include_examples 'imagemagick::init'

    # the host name should be set to host
    describe host(ENV['TARGET_HOST']) do
      it { should be_resolvable }
    end

    # SELinux should be disabled
    describe selinux do
      it { should be_disabled }
    end

    # TODO verify command outputs

end
