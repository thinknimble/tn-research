# Dynamically set site.url from environment variable
# Allows Cloudflare Pages to use the deployment URL for previews
Jekyll::Hooks.register :site, :after_init do |site|
  # Override URL based on environment
  if ENV['CF_PAGES_BRANCH']
    # Cloudflare Pages deployment
    if ENV['CF_PAGES_BRANCH'] == 'main'
      site.config['url'] = 'https://tn-research.pages.dev'
      site.config['baseurl'] = ''
    else
      # PR preview - use CF_PAGES_URL
      site.config['url'] = ENV['CF_PAGES_URL']
      site.config['baseurl'] = ''
    end
  elsif ENV['JEKYLL_URL']
    # Manual override via environment variable
    site.config['url'] = ENV['JEKYLL_URL']
    site.config['baseurl'] = ''
  end
end
