# uclalib_serverspec_samvera
A place to manage the growing collection of ServerSpec tests for UCLA Library's Samvera infrastructure.

Uses [ServerSpec](https://serverspec.org/) to test our [Samvera](https://samvera.org/) infrastructure. These tests
started out small, as a way to confirm the provisioning results of [Vagrant_Embark](https://github.com/hardyoyo/vagrant_embark)
are what we intended. Those [tests are still in Vagrant_Embark](https://github.com/hardyoyo/vagrant_embark/tree/master/serverspec).

These tests are intended to expand upon that work, and be usuable to test our staging and production environments.

## ServerSpec Resources
Here are a few helpful resources, which contributed to the writing of these tests:

 * https://www.singlestoneconsulting.com/articles/writing-efficient-infrastructure-tests-with-serverspec
 * https://github.com/miroswan/vagrant_spec/wiki/ServerSpec-Testing
