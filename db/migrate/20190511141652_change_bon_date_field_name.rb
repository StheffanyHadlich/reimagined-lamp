class ChangeBonDateFieldName < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :bon_date, :born_date
  end
end
