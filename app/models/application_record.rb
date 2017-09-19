# Parent Model that all Models inherit
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
