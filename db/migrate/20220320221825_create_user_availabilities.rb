class CreateUserAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :user_availabilities do |t|
      t.references :user, foreign_key: true
      t.string :status
      t.string :integer

      t.timestamps
    end
  end
end
