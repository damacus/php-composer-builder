# encoding: utf-8
# copyright: 2018, Damacus.io

title 'PHP Composer'

control 'composer-commands' do
  impact 1
  title 'composer'
  desc 'Should respond to the composer command'

  describe command('composer') do
    its('exit_status') { should match 0 }
    its('stdout') { should match /Composer version/ }
    its('stdout') { should_not match %r{Do not run Composer as root/super user} }
  end

  describe command("composer -V | grep version | awk '{ print $3 }' | tr -d '\n'") do
    its('exit_status') { should match 0 }
    its('stdout') { should cmp > '1.7.1' }
  end

  describe command('composer search jenssegers/chef') do
    its('exit_status') { should match 0 }
  end

  describe command('git') do
    its('stdout') { should match /These are common Git commands used in various situations/ }
  end
end

control 'PHP' do
  title 'Version'
  impact 1
  desc 'PHP should be recent version'
  describe package('php') do
      it { should be_installed }
      its('version') { should cmp > '7.2.9' }
  end
end

control 'OpenSSL' do
  title 'openssl'
  desc 'OpenSSL version'
  describe package('openssl') do
    it { should be_installed }
    its('version') { should cmp > '1.0.1' }
  end
end
