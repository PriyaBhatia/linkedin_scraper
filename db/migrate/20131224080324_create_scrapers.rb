class CreateScrapers < ActiveRecord::Migration
  def change
    create_table :scrapers do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :name
      t.string :location
      t.string :industry
      t.string :picture
      t.text :skills
      t.text :organizations
      t.text :education
      t.text :websites
      t.text :groups
      t.text :languages
      t.text :certifications
      t.timestamps
    end
  end
end
