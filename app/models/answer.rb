class Answer < ActiveRecord::Base
	attr_accessible :content, :question_id, :is_right
	belongs_to :question
end
