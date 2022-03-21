class FixUserAvailabilitiesColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_availabilities, :integer
    change_column :user_availabilities, :status, :integer
  end
end
