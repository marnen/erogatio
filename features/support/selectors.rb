module SelectorHelpers
  def selector_for(selector_name)
    case selector_name
    when 'the work unit'
      "##{ActionView::RecordIdentifier::dom_id @work_unit}"
    else
      raise ArgumentError, "Selector for '#{selector_name}' is not defined. Please add a mapping in #{__FILE__}."
    end
  end
end

World SelectorHelpers
