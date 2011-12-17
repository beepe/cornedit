class CreateCornwallEvents < ActiveRecord::Migration
  def change
    create_table :cornwall_events do |t|
      t.string :active
      t.date :date
      t.string :headline_en
      t.string :headline_de
      t.string :subtitle_en
      t.string :subtitle_de
      t.text :text_en
      t.text :text_de
      t.string :pdf_url

      t.timestamps
    end
  end
end
