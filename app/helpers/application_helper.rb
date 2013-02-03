module ApplicationHelper
  def angular_scope(model)
    content_tag("rails-scope", model.to_json, { :'ng-hide' => true })
  end
end
