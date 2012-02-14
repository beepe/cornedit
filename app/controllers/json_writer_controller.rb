class JsonWriterController < ApplicationController

  def write_json_file
     @cornwall_events = CornwallEvent.where("active != :active",{:active => "no"}).order(:sequence_no)
     
     name = File.join "public", "events_data"
     File.open(name, 'w') do |f|
        f.write(@cornwall_events.to_json)
     end
  end

end
