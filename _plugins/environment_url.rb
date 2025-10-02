# Dynamically set site.url from environment variable
# Allows Cloudflare Pages to use the deployment URL for previews
Jekyll::Hooks.register :site, :after_init do |site|
  # Cloudflare Pages sets CF_PAGES_URL but it may include path
  # Use the branch-specific URL instead
  if ENV['CF_PAGES_BRANCH']
    # For production branch, use main pages.dev URL
    # For PR previews, CF will set the full preview URL
    if ENV['CF_PAGES_BRANCH'] == 'main'
      site.config['url'] = 'https://tn-research.pages.dev'
    elsif ENV['URL']
      # Netlify/Vercel style - use URL env var
      site.config['url'] = ENV['URL']
    end
  elsif ENV['JEKYLL_URL']
    site.config['url'] = ENV['JEKYLL_URL']
  end
end
