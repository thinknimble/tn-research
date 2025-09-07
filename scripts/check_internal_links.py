#!/usr/bin/env python3
"""
Check for dead internal links in Jekyll site
"""

import os
import re
from pathlib import Path
import sys

# Configuration
EXCLUDED_PATTERNS = [
    '_site',           # Jekyll build output
    '.git',            # Git directory
    'README.md',       # Documentation files
    'CONTRIBUTING.md',
    'LICENSE.md', 
    'CLAUDE.md',
    '.claude/',        # Agent documentation
]

# Jekyll collections that map to URL paths
COLLECTIONS = {
    'notes': '_notes',
    'essays': '_essays', 
    'publications': '_publications',
    'posts': '_posts',
    'projects': '_projects',
}

def find_all_files():
    """Find all markdown and HTML files"""
    files = []
    for ext in ['*.md', '*.html']:
        files.extend(Path('.').glob(f'**/{ext}'))
    
    # Filter out excluded patterns
    filtered_files = []
    for f in files:
        file_str = str(f)
        if not any(pattern in file_str for pattern in EXCLUDED_PATTERNS):
            filtered_files.append(f)
    
    return filtered_files

def extract_internal_links(filepath):
    """Extract internal links from a file"""
    links = []
    content = filepath.read_text(encoding='utf-8')
    
    # Find markdown links: [text](/path) or [text](path)
    md_links = re.findall(r'\[([^\]]+)\]\((/[^)]+|[^:)]+)\)', content)
    for text, link in md_links:
        # Skip external links and anchors
        if not link.startswith('http') and not link.startswith('#') and not link.startswith('mailto:'):
            links.append((link, text))
    
    # Find wiki-style links: [[Note Title]]
    wiki_links = re.findall(r'\[\[([^\]]+)\]\]', content)
    for title in wiki_links:
        # Wiki links should resolve to notes
        slug = title.lower().replace(' ', '-')
        links.append((f'/notes/{slug}', title))
    
    # Find HTML href links
    href_links = re.findall(r'href="(/[^"]+)"', content)
    for link in href_links:
        if not link.startswith('http') and not link.startswith('#'):
            links.append((link, ''))
    
    return links

def check_link_exists(link, base_path='.'):
    """Check if an internal link resolves to a file"""
    # Remove fragment identifiers
    link = link.split('#')[0]
    
    # Handle different link types
    if link.startswith('/'):
        # Absolute path from site root
        link = link[1:]
    
    # Check for collection permalinks
    collection_found = False
    for url_path, file_dir in COLLECTIONS.items():
        if link.startswith(f'{url_path}/'):
            item_name = link.replace(f'{url_path}/', '').rstrip('/')
            possible_files = [
                f'{file_dir}/{item_name}.md',
                f'{file_dir}/{item_name}',
            ]
            collection_found = True
            break
    
    if not collection_found:
        if link.endswith('/'):
            # Directory index
            possible_files = [
                f'{link}index.html',
                f'{link}index.md',
                f'{link[:-1]}.html',
                f'{link[:-1]}.md',
            ]
        else:
            # Regular file
            possible_files = [
                link,
                f'{link}.html',
                f'{link}.md',
                f'{link}/index.html',
                f'{link}/index.md',
            ]
    
    for possible_file in possible_files:
        if Path(base_path, possible_file).exists():
            return True
    
    return False

def main():
    """Main function"""
    files = find_all_files()
    dead_links = []
    wiki_links = []
    template_links = []
    
    print(f"Scanning {len(files)} files for internal links...")
    
    for filepath in files:
        content = filepath.read_text(encoding='utf-8')
        
        # Check for wiki-style links separately
        wiki_matches = re.findall(r'\[\[([^\]]+)\]\]', content)
        for title in wiki_matches:
            slug = title.lower().replace(' ', '-')
            link = f'/notes/{slug}'
            if not check_link_exists(link):
                wiki_links.append({
                    'file': str(filepath),
                    'link': link,
                    'text': title
                })
        
        # Check regular links
        links = []
        # Find markdown links: [text](/path) or [text](path)
        md_links = re.findall(r'\[([^\]]+)\]\((/[^)]+|[^:)]+)\)', content)
        for text, link in md_links:
            # Skip external links and anchors
            if not link.startswith('http') and not link.startswith('#') and not link.startswith('mailto:'):
                links.append((link, text))
        
        # Find HTML href links
        href_links = re.findall(r'href="(/[^"]+)"', content)
        for link in href_links:
            # Skip external links and anchors
            if not link.startswith('http') and not link.startswith('#'):
                # Track Jekyll/Liquid template variables separately
                if '{{' in link or '{%' in link:
                    template_links.append({
                        'file': str(filepath),
                        'link': link,
                        'text': ''
                    })
                else:
                    links.append((link, ''))
        
        for link, text in links:
            if not check_link_exists(link):
                dead_links.append({
                    'file': str(filepath),
                    'link': link,
                    'text': text
                })
    
    # Report results
    has_errors = False
    
    if template_links:
        print(f"\n⚠️  Found {len(template_links)} template links (processed at build time):\n")
        for item in template_links:
            print(f"  File: {item['file']}")
            print(f"    Template link: {item['link']}")
        print()
    
    if wiki_links:
        print(f"\n⚠️  Found {len(wiki_links)} missing wiki-style linked notes (these are expected for planned content):\n")
        for item in wiki_links:
            print(f"  File: {item['file']}")
            print(f"    Missing note: [[{item['text']}]] -> {item['link']}")
        print()
    
    if dead_links:
        print(f"\n❌ Found {len(dead_links)} dead internal links:\n")
        for item in dead_links:
            print(f"  File: {item['file']}")
            print(f"    Dead link: {item['link']}")
            if item['text']:
                print(f"    Link text: {item['text']}")
            print()
        has_errors = True
    
    if not dead_links and not wiki_links and not template_links:
        print("\n✅ No dead internal links found!")
    elif not dead_links:
        print("\n✅ No dead links found (wiki-style and template links are warnings only)")
    
    return 1 if has_errors else 0

if __name__ == '__main__':
    sys.exit(main())