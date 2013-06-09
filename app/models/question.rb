class Question < ActiveRecord::Base
	attr_accessible :content, :quiz_id, :answers_attributes
	belongs_to :quiz
	has_many :answers
	accepts_nested_attributes_for :answers, allow_destroy: true
end
