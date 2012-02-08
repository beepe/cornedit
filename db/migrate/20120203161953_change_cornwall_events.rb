class ChangeCornwallEvents < ActiveRecord::Migration
  def up
      add_column    :cornwall_events,  :sequence_no,   :integer
      change_column :cornwall_events,  :date, :string
      rename_column :cornwall_events,  :date, :date_or_string
  end
end
