class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :name, null: false
    	t.string :telephone, null: false
    	t.text :introduction, null: false
    	t.string :profile_image_id
    	t.boolean :status, null: false, default: true

    	t.timestamps
    end
  end
end
