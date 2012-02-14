class PdfFlyer < ActiveRecord::Base
  validates :filename, presence: true, uniqueness:true
  
  
   # Root directory of the photo public/photos
   PDF_STORE = File.join 'public', 'pdf'

   # Invoke save_pdf method when save is completed
   after_save :save_pdf
   
   # Invoke delete_pdf when delete is complete
   before_destroy :delete_pdf
   
   
   # "f.file_field :load_photo_file" in the view triggers Rails to invoke this method
   # This method only store the information
   # The file saving is done in after_save
   def load_pdf_file=(data)
     # Record the filename
     self.filename = data.original_filename
     # Store the data for later use
     @pdf_data = data
   end

   # Called when save is completed
   def save_pdf
     if @pdf_data
       # Write the data out to a file
       name = File.join PDF_STORE, self.filename
       File.open(name, 'wb') do |f|
         f.write(@pdf_data.read)
       end
       @pdf_data = nil
     end
   end
   



   # Called to delete a file
   def delete_pdf
       name = File.join PDF_STORE, self.filename
       File.delete(name)
   end
   
end
