class Craft < ActiveRecord::Base
	has_many :resources
	belongs_to :classifications

	def self.check_classification(clpath, crpath)
		uncached do
			result = where("classification_id = ? AND path = ?", Classification.find_by_path(clpath).id, crpath)
			if result[0] == Craft.find_by_path(crpath)
				return Craft.find_by_path(crpath)
			end
		end
	end

	def self.home_list
		uncached do
			limit(4)
		end
	end
end