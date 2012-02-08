class ChangeCornwallEvents2 < ActiveRecord::Migration
  def up
      add_column    :cornwall_events,  :date_or_string_de,   :string
      rename_column :cornwall_events,  :date_or_string, :date_or_string_en
  end
end
