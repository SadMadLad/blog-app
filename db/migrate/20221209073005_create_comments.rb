class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :article, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
