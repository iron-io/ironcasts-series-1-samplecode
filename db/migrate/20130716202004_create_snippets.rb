class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :language
      t.text :plain_code
      t.text :highlighted_code

      t.timestamps
    end
  end
end
