---
layout: default
---

## Prerequisite: Setting up Amazon S3

The recommended setup for this plugin is to have a dedicated AWS user for the bucket where the Redmine data is going to be stored. How to create such a user is explained in [this guide]({% post_url 2016-10-17-aws-user-creation %}). After creating a user, you should check out the [guide on how to create the S3 bucket]({% post_url 2016-10-16-creating-and-configuring-the-amazon-s3-bucket %}).


## Important security note

**After files are uploaded they are made public to anyone who knows the URL.**


## Installation of the Redmine plugin

1. Change into your Redmine installation's root directory
2. Clone the plugin
  * `git clone https://github.com/x3ro/redmine_amazon_s3 plugins/amazon_s3`
3. Copy the default configuration into your Redmien setup
  * `cp plugins/amazon_s3/config/s3.yml.example config/s3.yml`
5. Update your dependencies
  * `bundle install --without development test`
6. Delete the `.git` directory of the plugin and commit it to your favorite version control system
  * `rm -Rf plugins/redmine_s3/.git`


## Configuration of the Redmine plugin

To perform this step, you should have the following information from Amazon AWS:

* Access key and secret of the user which has access to the target S3 bucket
* Name of the target bucket
* Region identifier where the bucket was created

Now open the `config/s3.yml` file you've previously copied and fill in the blanks. Each option is explained in the configuration file itself, or [here](https://github.com/x3ro/redmine_amazon_s3/blob/master/config/s3.yml.example).


## Optional: Migrating existing files to Amazon S3

Run `rake redmine_s3:files_to_s3` to upload files in your files folder to s3

TODO: Test


## Options Overview

* After files are uploaded they are made public, unless private is set to true.
* Files can use private signed urls using the private option
* Private file urls can expire a set time after the links were generated using the expires option
* If you're using a Amazon S3 clone, then you can do the download relay by using the proxy option.