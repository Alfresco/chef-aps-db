#
# Cookbook Name:: aps-db
# Spec:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

require 'spec_helper'

RSpec.describe 'aps-db::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '7.2.1511',
      file_cache_path: '/var/chef/cache'
    ) do |node|
    end.converge(described_recipe)
  end

  before do
    stub_command('ls /var/lib/pgsql/9.4.6/data/recovery.conf').and_return('')
  end

  context 'When all attributes are default, on an unspecified platform' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes the `mysql` recipe when engine is mysql' do
      chef_run.node.normal['aps-db']['engine'] = 'mysql'
      chef_run.converge(described_recipe)
      expect(chef_run).to include_recipe('aps-db::mysql')
    end

    it 'includes the `postgres` recipe when engine is postgres' do
      chef_run.node.normal['aps-db']['engine'] = 'postgres'
      chef_run.converge(described_recipe)
      expect(chef_run).to include_recipe('aps-db::postgres')
    end
  end
end
