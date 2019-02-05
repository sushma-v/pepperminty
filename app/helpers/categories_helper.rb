module CategoriesHelper
  def nested_attributes(attributes)
    content_tag :ul do
      attributes.each do |attribute|
        concat(content_tag(:li) do
          if attribute.has_children?
            concat(link_to(attribute.name, '#'))
            concat(nested_attributes(attribute.children))
          else
            link_to(attribute.name, '#')
          end
        end)

      end
    end
  end
end

#<div class="tree"><%= nested_attributes(Category.all.roots) %></div>