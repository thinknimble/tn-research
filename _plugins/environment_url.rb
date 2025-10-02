# Dynamically set site.url from environment variable
# Allows Cloudflare Pages to use CF_PAGES_URL for previews
Jekyll::Hooks.register :site, :after_init do |site|
  if ENV['CF_PAGES_URL']
    site.config['url'] = ENV['CF_PAGES_URL']
  elsif ENV['JEKYLL_URL']
    site.config['url'] = ENV['JEKYLL_URL']
  end
end
