class User
  include Mongoid::Document
  include GlobalID::Identification
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  after_save { UserBroadcastJob.perform_later self }
end
