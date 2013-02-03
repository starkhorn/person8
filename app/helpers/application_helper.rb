module ApplicationHelper
  def angular_scope(model)
    unless model.empty?
      content_tag("angular-scope", model.to_json, { :'ng-hide' => true })
    end
  end
end
