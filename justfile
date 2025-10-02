# Start development server (default port 4001)
up:
    docker-compose up

# Stop Docker containers
down:
    docker-compose down

# Build the Docker image
build:
    docker-compose build

# Clean build artifacts and Docker resources
reset:
    docker-compose down -v
    rm -rf _site .jekyll-cache .sass-cache

# Check for broken links (requires htmlproofer gem)
check-links:
    bundle exec jekyll build
    bundle exec htmlproofer ./_site --disable-external

# Create a new note (usage: just new-note "Note Title")
new-note title:
    #!/usr/bin/env bash
    slug=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
    date=$(date +%Y-%m-%d)
    filename="_notes/${slug}.md"
    cat > "${filename}" << EOF
    ---
    layout: note
    title: "{{title}}"
    date: ${date}
    updated: ${date}
    tags: []
    attribution: human-written
    authors: []
    status: budding
    summary: ""
    ---

    EOF
    echo "Created ${filename}"

# Create a new essay (usage: just new-essay "Essay Title")
new-essay title:
    #!/usr/bin/env bash
    slug=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
    date=$(date +%Y-%m-%d)
    filename="_essays/${slug}.md"
    cat > "${filename}" << EOF
    ---
    layout: essay
    title: "{{title}}"
    subtitle: ""
    date: ${date}
    authors: []
    attribution: human-written
    abstract: ""
    readtime: ""
    status: draft
    published: false
    related_notes: []
    ---

    EOF
    echo "Created ${filename}"

# Create a new project (usage: just new-project "Project Title")
new-project title:
    #!/usr/bin/env bash
    slug=$(echo "{{title}}" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
    date=$(date +%Y-%m-%d)
    filename="_projects/${slug}.md"
    cat > "${filename}" << EOF
    ---
    layout: project
    title: "{{title}}"
    subtitle: ""
    date: ${date}
    end_date: present
    status: active
    banner_image: ""
    description: ""
    technologies: []
    github_url: ""
    tags: []
    ---

    EOF
    echo "Created ${filename}"