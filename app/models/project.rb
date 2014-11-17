class Project < ActiveRecord::Base
  belongs_to :company
  has_many :works
  has_many :users, through: :works

  validates :name, presence: true, length: { minimum: 5 }
  validates :default_rate, presence: true,
                           numericality: { only_integer: true,
                                           greater_than_or_equal_to: 50 }
  validates :company, presence: true
  validates :slug, length: { minimum: 3 }
  validates :slug, uniqueness: true


  scope :lowrate, -> { where("default_rate < 100") }
end
