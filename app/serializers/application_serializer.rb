class ApplicationSerializer < ActiveModel::Serializer
  def self.attributes(attrs, options = {})
    unless options.is_a? Hash
      attrs = [*attrs] + [options]
      options = {}
    end

    [*attrs].each { |attr| attribute(attr, options) }
  end
end
