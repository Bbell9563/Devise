class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :query
      t.string :correct_answer
      t.string :wrong_answer, array: true, default: []
      t.belongs_to :quiz, null: false, foreign_key: true
    

      t.timestamps
    end
  end
end
