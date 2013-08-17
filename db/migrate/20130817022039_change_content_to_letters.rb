class ChangeContentToLetters < ActiveRecord::Migration
  def change
    change_column :letters, :content, :text
  end
end
