class Brand < ActiveRecord::Base
  include VerifyModule
  
  belongs_to :client
  has_many :products, :dependent => :destroy
  
  validates_uniqueness_of :name, :scope => [:client_id]
  validates_presence_of :name, :description
  validates_length_of :name, :in => 3..255
  validates_length_of :description, :minimum => 10
end
