class RemoveColumnFromScrapers < ActiveRecord::Migration
  def change
  	remove_column :scrapers,:organizations
  	remove_column :scrapers,:education
		remove_column :scrapers,:websites
		remove_column :scrapers,:groups
		remove_column :scrapers,:languages
		remove_column :scrapers,:certifications
		remove_column :scrapers,:current_companies
  end
end
