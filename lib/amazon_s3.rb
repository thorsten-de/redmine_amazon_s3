require 'amazon_s3/patches/attachment_patch'
require 'amazon_s3/patches/attachments_controller_patch'
require 'amazon_s3/patches/application_helper_patch'
require 'amazon_s3/thumbnail'
require 'amazon_s3/configuration'
require 'amazon_s3/connection'
require 'amazon_s3/patches/pdf_image_loader_patch'
require 'amazon_s3/patches/patch_pdf_attach_for_external_files'

AttachmentsController.send(:include, AmazonS3::AttachmentsControllerPatch)
Attachment.send(:include, AmazonS3::AttachmentPatch)
ApplicationHelper.send(:include, AmazonS3::ApplicationHelperPatch)



Redmine::Export::PDF::ITCPDF.send(:include, AmazonS3::PdfImageLoaderPatch)
Redmine::Export::PDF::RDMPdfEncoding.singleton_class.prepend AmazonS3::PatchPdfAttachForExternalFiles
