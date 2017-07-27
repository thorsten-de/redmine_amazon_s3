module AmazonS3
  module PatchPdfAttachForExternalFiles
    def attach(attachments, filename, encoding)
      attachment = super(attachments, filename, encoding)
      p attachment
      return attachment if attachment

      
      puts filename

      /attachment.*\/(\d+)\/*.*\.(gif|jpeg|jpg|png)/.match(filename) do |match|
        p match
        attachment = Attachment.find(match[1])
        p attachment
        if attachment && attachment.readable? && attachment.visible?
          return attachment
        else
          return nil
        end
      end              
    end    
  end
end