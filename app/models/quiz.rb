class Quiz < ActiveRecord::Base
	attr_accessible :name, :questions_attributes
	has_many :questions
	belongs_to :user
	accepts_nested_attributes_for :questions, allow_destroy: true
end
