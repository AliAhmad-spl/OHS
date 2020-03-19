class Hostel < ApplicationRecord
  enum status: [:pending, :published, :rejected]
  enum air_conditioned: [:optional, :yes, :no]
  
  belongs_to :user
end