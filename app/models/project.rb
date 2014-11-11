class Project < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :users, through: :works

  scope :lowrate, -> { where("default_rate < 100") }
end
