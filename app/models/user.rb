class User < ApplicationRecord
  # define the column of inheritance
  self.inheritance_column = :type

  # Add scopes to the parent models for each child model
  scope :common_user, -> { where(type: 'CommonUser') }
  scope :admin, -> { where(type: 'Admin') }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  validates_format_of :email,:with => EMAIL_REGEX
  validates_presence_of :type

  def self.types
    %w(CommonUser Admin)
  end
end
