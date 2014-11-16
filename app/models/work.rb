class Work < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :hours, numericality: { only_integer: true, greater_than: 0,
                                    less_than_or_equal_to: 8 }
  validates :project, presence: true
  validates :user, presence: true
  validates :datetimeperformed, presence: true
  validate  :date_performed_cannot_be_in_the_future

  scope :fullday,-> { where("hours >= 8") }
  scope :recent, -> { where("datetimeperformed > '#{Time.now - 7.days}'") }


  def date_performed_cannot_be_in_the_future
    if datetimeperformed.present? && datetimeperformed > Date.today
      errors.add(:datetimeperformed, "can't be in the future")
    end
  end
end
