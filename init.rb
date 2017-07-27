require 'amazon_s3'
require_dependency 'amazon_s3_hooks'

Redmine::Plugin.register :amazon_s3 do
  name 'AmazonS3'
  version '0.0.0'
  description 'Use Amazon S3 as a storage engine for attachments'
  url 'https://github.com/thorsten-de/redmine_amazon_s3'
  author 'Lucas Jenß'
  author_url 'https://x3ro.de'
end
