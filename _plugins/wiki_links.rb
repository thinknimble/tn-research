# Wiki-style link converter for Jekyll
# Converts [[Note Title]] to proper links

module Jekyll
  class WikiLinks < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      # Create a mapping of note titles to URLs
      notes_map = {}
      
      # Add notes to the map
      site.collections['notes'].docs.each do |note|
        notes_map[note.data['title'].downcase] = note.url
        # Also map by filename without extension
        notes_map[File.basename(note.path, '.md').downcase] = note.url
      end
      
      # Add essays to the map
      site.collections['essays'].docs.each do |essay|
        notes_map[essay.data['title'].downcase] = essay.url
        notes_map[File.basename(essay.path, '.md').downcase] = essay.url
      end
      
      # Process all documents to convert wiki links
      all_docs = site.collections.values.flat_map(&:docs) + site.pages
      
      all_docs.each do |doc|
        if doc.content
          doc.content = doc.content.gsub(/\[\[([^\]]+)\]\]/) do |match|
            link_text = $1
            link_key = link_text.downcase
            
            if notes_map[link_key]
              "<a href=\"#{notes_map[link_key]}\" class=\"wiki-link\">#{link_text}</a>"
            else
              "<span class=\"wiki-link-missing\" title=\"Note not found\">#{link_text}</span>"
            end
          end
        end
      end
    end
  end
end