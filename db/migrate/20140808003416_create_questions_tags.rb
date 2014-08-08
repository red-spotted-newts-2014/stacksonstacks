class CreateQuestionsTags < ActiveRecord::Migration
  def change
    create_table :questions_tags do |t|
      t.references :question
      t.references :tag

      t.timestamps
    end
  end
end
