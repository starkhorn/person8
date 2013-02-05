module ApplicationHelper
  def angular_scope(model)
    unless model.empty?
      content_tag("angular-scope", model.to_json, { :'ng-hide' => true })
    end
  end

  def angular_repeat_block(expression, is_last_element)
    haml_tag(:div, :ng_repeat => expression, :class => "#{'rails-template' unless is_last_element}") do
      yield
    end
  end

  def asset_exists?(name)
    !Rails.application.assets.find_asset(name).nil?
  end
end
