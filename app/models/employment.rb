class Employment < ApplicationRecord
  belongs_to :client
  belongs_to :user
  validates_presence_of :employment_date
  #before_save :format_date

  def format_date
    employment_date = Date.strptime(employment_date.strftime("%d/%m/%Y"), "%m/%d/%Y")
  end

end
