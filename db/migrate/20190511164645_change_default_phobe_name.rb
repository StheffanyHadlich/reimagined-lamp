class ChangeDefaultPhobeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :phones, :default_phobe, :default_phone
  end
end
