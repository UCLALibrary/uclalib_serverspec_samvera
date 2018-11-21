# uclalib_serverspec_samvera
A place to manage the growing collection of ServerSpec tests for UCLA Library's Samvera infrastructure.

Uses [ServerSpec](https://serverspec.org/) to test our [Samvera](https://samvera.org/) infrastructure. These tests
started out small, as a way to confirm the provisioning results of [Vagrant_Embark](https://github.com/hardyoyo/vagrant_embark)
are what we intended. Those [tests are still in Vagrant_Embark](https://github.com/hardyoyo/vagrant_embark/tree/master/serverspec).

These tests are intended to expand upon that work, and be usuable to test our staging and production environments.

## Requirements
You'll need Ruby and the Serverspec gem installed: `gem install serverspec`.

You'll also need to have your public SSH key installed for the deploy user on the environment you want to test.

You'll also need to have the following configurations in your .ssh/config file:

```
Host *
    ServerAliveInterval 300
    ServerAliveCountMax 2

Host jumpbox
    HostName jump.library.ucla.edu
    Port 31926
    User your-username

Host californica-dev
    HostName californica-dev.library.ucla.edu
    ProxyCommand ssh -A -q jumpbox nc californica-dev.library.ucla.edu 22

Host californica-test
    HostName californica-test.library.ucla.edu
    ProxyCommand ssh -A -q jumpbox nc californica-test.library.ucla.edu 22

Host californica-stage
    HostName californica-stage.library.ucla.edu
    ProxyCommand ssh -A -q jumpbox nc californica-stage.library.ucla.edu 22

Host californica
    HostName californica.library.ucla.edu
    ProxyCommand ssh -A -q jumpbox nc californica.library.ucla.edu 22
    
Host ursus-test
    HostName ursus-test.library.ucla.edu
    ProxyCommand ssh -A -q jumpbox nc ursus-test.library.ucla.edu 22

Host ursus-stage
    HostName ursus-stage.library.ucla.edu
    ProxyCommand ssh -A -q jumpbox nc ursus-stage.library.ucla.edu 22

Host ursus-dev
    HostName ursus-dev.library.ucla.edu
    ProxyCommand ssh -A -q jumpbox nc ursus-dev.library.ucla.edu 22

Host ursus
    HostName ursus.library.ucla.edu
    ProxyCommand ssh -A -q jumpbox nc ursus.library.ucla.edu 22

```

## Running a test
You'll be using Rake to run the tests, run `rake -T` to see what tasks are defined. Here's an example task for californica-test:

```
rake spec:californica-test
/home/hpottinger/.rbenv/versions/2.5.1/bin/ruby -I/home/hpottinger/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/rspec-support-3.8.0/lib:/home/hpottinger/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/rspec-core-3.8.0/lib /home/hpottinger/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/rspec-core-3.8.0/exe/rspec --pattern \{base,californica-test\}/\*_spec.rb
..................................

Finished in 16.84 seconds (files took 0.39981 seconds to load)
34 examples, 0 failures
```

## ServerSpec Resources
Here are a few helpful resources, which contributed to the writing of these tests:

 * https://www.singlestoneconsulting.com/articles/writing-efficient-infrastructure-tests-with-serverspec
 * https://github.com/miroswan/vagrant_spec/wiki/ServerSpec-Testing
