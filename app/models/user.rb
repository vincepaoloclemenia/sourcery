class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :address, dependent: :destroy
  has_one :employment, dependent: :destroy
  has_one :client, through: :employment, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :works, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == "admin"
  end

  def jobseeker?
    role == "jobseeker"
  end

  def finance_admin?
    role == "finance_admin"
  end

  def recruiter?
    role == "recruiter"
  end
end
