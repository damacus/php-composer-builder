# encoding: utf-8
# copyright: 2017, DeBankeGroup

title 'Composer Command'

control 'composer-commands' do
  impact 1
  title 'composer'
  desc 'Should respond to the composer command'
  describe command('composer') do
    its('exit_status') { should match 0 }
    its('stdout') { should match /Composer version 1.5.5/ }
  end

  describe command('git') do
    its('stdout') { should match /These are common Git commands used in various situations/ }
  end
end
