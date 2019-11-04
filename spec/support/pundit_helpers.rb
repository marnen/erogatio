module PunditHelpers
  def record_class_name(policy_class)
    policy_class.to_s.chomp 'Policy'
  end

  def record_class(policy_class)
    record_class_name(policy_class).constantize
  end
end

RSpec.configure {|c| c.include PunditHelpers, type: :policy }
