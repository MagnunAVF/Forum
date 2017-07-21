class User < ApplicationRecord
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  validates_format_of :email,:with => EMAIL_REGEX
end
