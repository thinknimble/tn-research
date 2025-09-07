module Jekyll
  class MessageTag < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @markup = markup.strip
    end

    def render(context)
      params = parse_params(@markup)
      author_slug = params['author-id'] || params['author'] || params['id']
      name_type = params['name'] || 'full'
      time = params['time']
      reactions = params['reactions']
      
      return "Author ID required" unless author_slug
      
      site = context.registers[:site]
      authors = site.collections['authors'].docs
      
      author = authors.find { |a| a.data['slug'] == author_slug }
      
      return "Author '#{author_slug}' not found" unless author
      
      author_data = author.data
      profile_pic = author_data['profile_pic'] || 'https://via.placeholder.com/150'
      
      display_name = if name_type == 'first'
        author_data['name'].split(' ').first
      else
        author_data['name']
      end
      
      author_url = author.url
      
      # Get the content inside the block
      message_content = super.strip
      
      # Convert Markdown to HTML
      # Use Jekyll's markdown converter
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
      message_content = converter.convert(message_content)
      
      # Build the HTML
      timestamp_html = time ? %(<span class="conversation-timestamp">#{time}</span>) : ""
      
      # Parse reactions if provided (format: "emoji:count,emoji:count")
      reactions_html = ""
      if reactions
        reactions_html = %(<div class="message-reactions">)
        reactions.split(',').each do |reaction|
          emoji, count = reaction.split(':')
          reactions_html += %(<span class="reaction">#{emoji} #{count}</span>)
        end
        reactions_html += %(</div>)
      end
      
      <<~HTML
        <div class="conversation-message">
          <span class="inline-author">
            <a href="#{author_url}" class="author-link">
              <img src="#{profile_pic}" alt="#{display_name}" class="author-mini-pic" />
              <span class="author-name">#{display_name}</span>
            </a>
          </span>#{timestamp_html}
          #{message_content}
          #{reactions_html}
        </div>
      HTML
    end
    
    private
    
    def parse_params(markup)
      params = {}
      markup.scan(/(\S+?)=["']([^"']+)["']/).each do |key, value|
        params[key] = value
      end
      params
    end
  end
end

Liquid::Template.register_tag('message', Jekyll::MessageTag)