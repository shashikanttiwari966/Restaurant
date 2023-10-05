class User < ApplicationRecord
  # attr_accessor :login
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable

  before_validation :set_role, on: :create
  validates_presence_of :email, if: :email_required?
  validates_presence_of :email, if: :password_required?
  validates_uniqueness_of :phone, if: :check_role?

  has_many :restaurants, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :card, dependent: :destroy

  # after_create do
  #   self.add_role :Owner
  # end

  
  # def login
  #   debugger
  #   @login || self.phone_number || self.email
  # end

  # def self.find_for_database_authentication(warden_conditions)
  #   debugger
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions.to_hash).where(["lower(phone) ilike '%#{login.downcase}%' or lower(email) = :value", { :value => login.downcase }]).first
  #   elsif conditions.has_key?(:phone_number) || conditions.has_key?(:email)
  #     where(conditions.to_hash).first
  #   end
  # end

  def set_role
    self.add_role :User
  end

  def admin?
    has_role? :Admin
  end

  def user?
    has_role? :User
  end

  protected

  def password_required?
    false
  end

  def check_role?
    has_role? :User ? true : false
  end

  def email_required?
    false
    # has_role? :User ? false : true
  end

  def password_required?
    false
    # has_role? :User ? false : true
  end
end
