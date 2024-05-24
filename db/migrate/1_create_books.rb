ROM::SQL.migration do
  change do
    create_table? :books do
      primary_key :id, type: :bigint
      column :title, :text, null: false
      column :author_id, :bigint, null: false
      column :images, :jsonb
      index :author_id
    end
  end
end