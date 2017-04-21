#
# Cookbook Name:: aps-db
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe "aps-db::#{node['aps-db']['engine']}"
