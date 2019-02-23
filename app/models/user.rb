class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :to_do_list

  validates :name, presence: true
  validates :email, uniqueness: true

  before_save :downcase_fields

  def downcase_fields
    self.email.downcase!
  end

  after_create :welcome_send

  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
    redirect_to root_path, alert: "Thank you for the registration"
  end
end
