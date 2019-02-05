module CategoriesHelper
  def nested_attributes(attributes)
    content_tag :ul do
      attributes.each do |attribute|
        concat(content_tag(:li) { link_to(attribute.name, '#') })
        if attribute.has_children?
          concat(nested_attributes(attribute.children))
        end
      end
    end
  end
end
