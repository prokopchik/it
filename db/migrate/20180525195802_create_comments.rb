class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    	t.integer :article_id, index: true 
    	t.integer :parent_comment_id
    	t.integer :user_id, index: true 
    	t.text :body

    	t.timestamps
    end
  end
end
