class Budget < ApplicationRecord
  belongs_to :user

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  validates :title, presence: true
end
