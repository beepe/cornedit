class CornwallEvent < ActiveRecord::Base
  validates :active, :headline_en, :headline_de, :sequence_no, presence: true
  validates :sequence_no, numericality: true
  validates :sequence_no, uniqueness:true
  validates :active, :inclusion => { :in => %w(no both events news), 
    :message => "%{value} is not a valid activity status"}

end
