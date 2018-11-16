class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :address, dependent: :destroy
  has_one :employment, dependent: :destroy
  has_one :client, through: :employment, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :works, dependent: :destroy

  validates_presence_of :first_name, :last_name, message:  "cannot be blank"

  default_scope -> { order last_name: :asc }
  
  accepts_nested_attributes_for :employment, allow_destroy: true
  
  scope :employees, -> { where role: "employee" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "35x35>" }, default_url: "/img/no-user-image.jpg"
  validates_attachment :avatar,
                      :content_type => { :content_type => /^image\/(png|gif|jpeg|jpg)/, message: "must be in the format png|gif|jpg" },
                      :size => { :in => 0..1000.kilobytes, message: "must be less than 1MB" }

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

  def full_name
    first_name + " " + last_name
  end
end
