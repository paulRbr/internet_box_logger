# [InternetBoxLogger][IBL]

 [![Build Status](https://travis-ci.org/lbriais/internet_box_logger.png?branch=master)](https://travis-ci.org/lbriais/internet_box_logger)
 [![Gem Version](https://badge.fury.io/rb/internet_box_logger.png)](http://badge.fury.io/rb/internet_box_logger)

## Overview

The goal of this gem is to provide an easy way to monitor your internet box status.
It primarily targets the box I am using (the Freebox V5 from the '[Free]' french ISP).

Currently supported box:

* Freebox V5

## Installation

### Dependencies

You need to have [ELK] installed, the fantastic software trilogy that brings you the power of analytics at your fingertips.
In our case we just need ElasticSearch and Kibana, LogStash is not needed, but you should not prevent yourself from
using it for log files of your own...

Follow [ELK] installation procedure before installing this Gem.

### Gem installation
Add this line to your application's Gemfile:

    gem 'internet_box_logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install internet_box_logger

## Usage

This Gem brings basically an executable '```internet_box_logger```' that will save the state of your box into an
ElasticSearch instance.

For this, it requires some configuration.

### Configuration

Configuration thanks to [EasyAppHelper][EAP] enables multiple places to store your configuration. But most useful one should be:

* '```/etc/internet_box_logger.conf```' for a system-wide installation
* '```~/.config/internet_box_logger.conf```' for a user-specific installation

The default configuration is the following in YAML format:

```yaml
box_type: InternetBoxLogger::Parsers::FreeboxV5Parser

cron_interval: 1

kibana_path: /opt/kibana

server_port: 5000

default_elastic_search:
  elastic_servers:
    - 127.0.0.1:9200
  elastic_binary: /opt/elasticsearch/bin/elasticsearch
```

```box_type``` specifies the module in charge of gathering data from your box. it Should not be changed but you can define
your own. **It is the way for you to add other types of boxes** if needed. If you do so, please do a pull-request
afterwards.

```cron_interval``` defines the time in minutes between two measurements.

```kibana_path``` defines where your [Kibana][ELK] is installed. This one is only used by a rake task to setup default
dashboards for your box. This is not really needed for the script to work.

```server_port``` defines the port to run a simple HTTP server to serve the Kibana UI.

```elastic_servers``` You can specify here, how to reach your ElasticSearch cluster. If you did the default install of
ElasticSearch on the same machine as the gem is installed, then it should already be the correct host:port.

```elastic_binary``` defines where your [ElasticSearch][ELK] is installed. This one is only used by a rake task
(to stop/start and get info) about the ElasticSearch cluster. This is not really needed for the script to work.

**These values are the default and you don't need to create a new config file if they already fit your needs.**

### Deploying Kibana reports

### Setting up the cron task

### Using the gem in your own projects

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


That's all folks.


[IBL]:  https://rubygems.org/gems/internet_box_logger        "internet_box_logger gem"
[Free]: http://free.fr                                       "Free French ISP"
[ELK]:  http://www.elasticsearch.org/overview/elkdownloads/  "ElasticSearch, LogStash, Kibana"
[EAP]:  https://rubygems.org/gems/easy_app_helper            "EasyAppHelper gem"
