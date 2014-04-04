#
# Cookbook Name:: rpm
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node[:rpm].each do |url|
  rpm = url.split('/', -1).last
  
  remote_file "#{Chef::Config[:file_cache_path]}/#{rpm}" do
    source url
    action :create
  end
  package rpm do
    action :install
    provider Chef::Provider::Package::Rpm
    source "#{Chef::Config[:file_cache_path]}/#{rpm}"
  end 
end
