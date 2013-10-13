module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge :renderer => BootstrapLinkRenderer
    end
    super *[collection_or_options, options].compact
  end

end
