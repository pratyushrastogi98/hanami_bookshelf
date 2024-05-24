ROM::SQL.migration do
  change do
    create_table? (:users) do
      primary_key :id, :bigint
      column :name, :text, null: false
      column :type, :text, null: false
      column :email, :text
      index [:name, :type], unique: true
    end
  end
end