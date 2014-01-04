class Owner < ActiveRecord::Base
  has_many :buildings,
  inverse_of: :owner,
  dependent: :nullify

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

end
