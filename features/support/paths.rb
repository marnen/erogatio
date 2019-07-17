module PathHelpers
  def path_to(page_name)
    case page_name
    when 'nonexistent so far'
      raise ArgumentError, 'this should never be reached'
    else
      begin
        path_helper = page_name.gsub(/\bpage$/, 'path').gsub(/^the /, '').gsub(' ', '_')
        self.send path_helper
      rescue NoMethodError
        raise ArgumentError, "Path to '#{page_name}' is not defined. Please add a mapping in #{__FILE__}."
      end
    end
  end

  private

  def model_path(model, action = nil)
    model.gsub! ' ', '_'
    path = [action, model, 'path'].compact.join '_'
    self.send path, instance_variable_get("@#{model}")
  end
end

World PathHelpers
