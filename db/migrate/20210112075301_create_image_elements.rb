class CreateImageElements < ActiveRecord::Migration[5.2]
  def change
    create_table :image_elements do |t|
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
