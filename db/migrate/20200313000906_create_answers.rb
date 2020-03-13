class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.text :descripition, null: false
      t.boolean :correct, dafault: false

      t.timestamps
    end
  end
end
