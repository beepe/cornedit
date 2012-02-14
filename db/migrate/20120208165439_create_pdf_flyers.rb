class CreatePdfFlyers < ActiveRecord::Migration
  def change
    create_table :pdf_flyers do |t|
      t.string :filename

      t.timestamps
    end
  end
end
