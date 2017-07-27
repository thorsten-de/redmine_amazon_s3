module AmazonS3
  module PatchPdfAttachForExternalFiles
    def attach(attachments, filename, encoding)
      attachment = super(attachments, filename, encoding)
      return attachment if attachment

      /attachments\/download\/(\d+)\/.*\.(gif|jpeg|jpg|png)\z/.match(filename) do |match|
        attachment = Attachment.find(match[1])
        if attachment && attachment.readable? && attachment.visible?
          return attachment
        else
          return nil
        end
      end              
    end    
  end
end