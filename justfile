# Development server (default port 4001)
serve:
    bundle exec jekyll serve --livereload --port 4001

# Build the site
build:
    bundle exec jekyll build

# Install dependencies
install:
    bundle install

# Clean build artifacts
clean:
    bundle exec jekyll clean

# Run development server with drafts
drafts:
    bundle exec jekyll serve --livereload --drafts

# Check for broken links (requires htmlproofer gem)
check-links:
    bundle exec jekyll build
    bundle exec htmlproofer ./_site --disable-external

# Create a new post (usage: just new-post "My Post Title")
new-post title:
    #!/usr/bin/env bash
    slug=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
    date=$(date +%Y-%m-%d)
    filename="_posts/${date}-${slug}.md"
    cat > "${filename}" << EOF
    ---
    layout: post
    title: "{{title}}"
    date: ${date}
    ---
    
    EOF
    echo "Created ${filename}"

# Create a new note (usage: just new-note "Note Title")
new-note title:
    #!/usr/bin/env bash
    slug=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
    date=$(date +%Y-%m-%d)
    filename="_notes/${date}-${slug}.md"
    cat > "${filename}" << EOF
    ---
    layout: note
    title: "{{title}}"
    date: ${date}
    tags: []
    ---
    
    EOF
    echo "Created ${filename}"

# Create a new essay (usage: just new-essay "Essay Title")
new-essay title:
    #!/usr/bin/env bash
    slug=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
    date=$(date +%Y-%m-%d)
    filename="_essays/${date}-${slug}.md"
    cat > "${filename}" << EOF
    ---
    layout: essay
    title: "{{title}}"
    date: ${date}
    status: draft
    ---
    
    EOF
    echo "Created ${filename}"