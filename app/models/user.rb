class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_rich_text :notes
  has_many :comments
  after_create :assign_default_role
  has_many :likes, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile, update_only: true


  before_create :build_profile
  after_create :welcome
  def welcome
    WelcomeMailer.welcome(self).deliver
  end

  validates :username,  presence: true, uniqueness: { :case_sensitive => false }, length: { in: 5..30 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  

  def av
    self.username[0].upcase
  end

  def likes?(episode)
    episode.likes.where(user_id: id).any?
  end

  def assign_default_role
    self.add_role(:member) if self.roles.blank?
  end

  
 end
