class Hostel < ApplicationRecord
  enum status: [:pending, :published, :rejected]
  enum air_conditioned: [:optional, :yes, :no]
  enum town: {"johar_town"=>0, "township"=>1, "model_town"=>2, "wapda_town"=>3, "baharia_town"=>4}
  
  belongs_to :user

  $prices = ['4000', '5000', '6500', '7000', '9000']
  $locations = towns.keys
  $facilities = ["Air Conditioned", "UPS", "Generator"]
end