# frozen_string_literal: true

# Base class for models to inherit from
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
