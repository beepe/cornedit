class ChangeCornwallEventsAddpdfen < ActiveRecord::Migration
  def up
      add_column    :cornwall_events,  :pdf_url_de,   :string
      rename_column :cornwall_events,  :pdf_url, :pdf_url_en
  end
end
