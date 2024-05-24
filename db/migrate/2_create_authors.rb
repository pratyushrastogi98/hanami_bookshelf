ROM::SQL.migration do
  change do
    create_table? :authors do
      primary_key :id, type: :bigint
      column :name, :text, null: false
      column :email, :text
      column :contact_no, :numeric
      index :email, unique: true
    end
  end
end