class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :website
      t.string :key
      t.string :secret

      t.timestamps
    end
  end
end
