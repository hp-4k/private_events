class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, index: { unique: true }
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
