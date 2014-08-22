class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :head
      t.string :title
      t.string :post
      t.references :contact
      t.timestamps
    end
  end
end
