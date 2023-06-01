class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.binary :ext_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
