module Web::ApplicationHelper

  def drop_down_link_to(name)
    link_to '#', :class => "dropdown-toggle", :data => {:toggle => "dropdown"} do
      [name, content_tag(:b, nil, :class => "caret")].join.html_safe
    end
  end
end
