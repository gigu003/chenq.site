function Pandoc(doc)
  local categories = doc.meta.categories
  if not categories then
    return doc
  end

  local related_posts = {}

  for _, post in ipairs(quarto.project.list_files("../qsight/")) do
    local meta = quarto.project.get_metadata(post)
    if meta.categories then
      for _, cat in ipairs(meta.categories) do
        for _, this_cat in ipairs(categories) do
          if cat == this_cat then
            table.insert(related_posts, {title = meta.title, url = post})
          end
        end
      end
    end
  end

  if #related_posts > 0 then
    local related_section = pandoc.Blocks({pandoc.Header(2, "Related Articles")})
    for _, post in ipairs(related_posts) do
      table.insert(related_section, pandoc.Plain({pandoc.Link(post.title, post.url)}))
    end
    table.insert(doc.blocks, related_section)
  end

  return doc
end
