class Scraper < ActiveRecord::Base
	serialize :organizations,Array
	serialize :education,Array
	serialize :websites,Array
	serialize :groups,Array
	serialize :languages,Array
	serialize :certifications,Array
	serialize :current_companies,Array
end
