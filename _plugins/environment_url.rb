# Dynamically set site.url from environment variable
# Allows Cloudflare Pages to use the deployment URL for previews
Jekyll::Hooks.register :site, :after_init do |site|
  # Debug: print environment variables
  puts "DEBUG: CF_PAGES_URL = #{ENV['CF_PAGES_URL']}"
  puts "DEBUG: CF_PAGES_BRANCH = #{ENV['CF_PAGES_BRANCH']}"
  puts "DEBUG: URL = #{ENV['URL']}"
  puts "DEBUG: Current site.url = #{site.config['url']}"

  # Override URL based on environment
  if ENV['CF_PAGES_BRANCH']
    # Cloudflare Pages deployment
    if ENV['CF_PAGES_BRANCH'] == 'main'
      site.config['url'] = 'https://tn-research.pages.dev'
      site.config['baseurl'] = ''
    end
  elsif ENV['JEKYLL_URL']
    site.config['url'] = ENV['JEKYLL_URL']
    site.config['baseurl'] = ''
  end

  puts "DEBUG: Final site.url = #{site.config['url']}"
  puts "DEBUG: Final site.baseurl = #{site.config['baseurl']}"
end
