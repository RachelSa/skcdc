class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def url_classname
    self.class.to_s.split("::").first.underscore.pluralize
  end

  def self.title_classname
    self.name.underscore.split("_").join(" ").pluralize
  end

  def title_or_name
    if self.title
      self.title
    else
      self.name
    end
  end
end
