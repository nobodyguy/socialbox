class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :content
      t.boolean :is_right
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
