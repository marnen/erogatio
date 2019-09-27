module PathHelpers
  def path_to(page_name)
    case page_name
    when 'the home page'
      '/'
    when 'the payment entry page for the work unit'
      new_work_unit_payment_path @work_unit
    when "the user's detail page"
      user_path @user
    when 'the work unit entry page'
      new_work_unit_path
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
