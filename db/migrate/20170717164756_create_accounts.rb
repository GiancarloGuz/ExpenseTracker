class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.integer :bank_id
      t.string  :account_number
      t.timestamps null: false
    end
  end
end
