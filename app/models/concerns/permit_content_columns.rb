module PermitContentColumns
  extend ActiveSupport::Concern

  class_methods do
    def permitted_params
      content_columns.map(&:name).reject {|name| name.ends_with? '_at' }
    end
  end
end
