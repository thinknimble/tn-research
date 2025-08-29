# Contributing to ThinkNimble Research Institute

We welcome contributions to the ThinkNimble Research Institute repository! This document provides guidelines for contributing to this project.

## Our Philosophy: Credit Where Credit's Due

At ThinkNimble, we believe in recognizing and attributing work appropriately. When you contribute to this repository or build upon existing work, we encourage:

- **Attributing work you build upon** - If your contribution extends or improves existing research, please credit the original authors
- **Sharing improvements** - We encourage you to share your enhancements back to the community
- **Crediting others** - When using or adapting work from this repository, please provide appropriate attribution

## How to Contribute

### Research Publications

1. **Format**: Research papers should be added to the `_publications/` directory
2. **Naming**: Use the format `YYYY-MM-DD-paper-title.md`
3. **Front Matter**: Include all required metadata:
   ```yaml
   ---
   layout: publication
   title: "Your Publication Title"
   date: 2024-01-01
   authors:
     - Your Name
     - Co-author Name
   abstract: "Brief description of the publication"
   pdf_url: "/path/to/pdf" # optional
   arxiv_url: "https://arxiv.org/..." # optional
   doi: "10.xxxx/xxxxx" # optional
   ---
   ```

### Blog Posts

1. **Location**: Add blog posts to the `_posts/` directory
2. **Naming**: Follow Jekyll convention: `YYYY-MM-DD-post-title.md`
3. **Content**: Focus on technical insights, research findings, or educational content

### Code Contributions

1. **Style**: Follow existing code conventions in the repository
2. **Testing**: Ensure any code changes don't break the Jekyll build
3. **Documentation**: Update relevant documentation when making changes

## Attribution Requirements

When contributing content that builds upon or references other work:

1. **In Publications**: Include proper citations in your bibliography
2. **In Code**: Add attribution comments where appropriate:
   ```javascript
   // Based on algorithm by [Author Name] (https://source-url)
   // Modified to support [your enhancement]
   ```
3. **In Blog Posts**: Link to original sources and credit authors inline

When creating derivative works based on this repository:

```markdown
---
# Attribution Example
based-on: ThinkNimble Research Institute (https://github.com/thinknimble/tn-research)
author: Your Organization (https://your-website.com)
source: https://github.com/yourusername/your-fork
---
```

## Submission Process

1. **Fork the Repository**: Create your own fork of the project
2. **Create a Feature Branch**: `git checkout -b feature/your-feature-name`
3. **Make Your Changes**: Implement your contribution
4. **Test Locally**: Run `bundle exec jekyll serve` to verify your changes
5. **Commit Your Changes**: Write clear, descriptive commit messages
6. **Push to Your Fork**: `git push origin feature/your-feature-name`
7. **Submit a Pull Request**: Provide a detailed description of your changes

## Pull Request Guidelines

Your pull request should:

- Have a clear, descriptive title
- Include a detailed description of changes
- Reference any related issues or discussions
- Include attribution for any work built upon
- Pass all build checks

## Code of Conduct

We maintain a welcoming and inclusive environment. Please:

- Be respectful and constructive in discussions
- Welcome newcomers and help them get started
- Focus on what is best for the community
- Show empathy towards other community members

## Licensing

By contributing to this repository, you agree that your contributions will be licensed under the same dual-license structure as the project:

- **Code**: Apache License 2.0
- **Content**: Creative Commons Attribution 4.0 International (CC BY 4.0)

You affirm that you have the right to license your contributions under these terms.

## Recognition

We value all contributions! Contributors will be:

- Credited in commit history
- Mentioned in release notes for significant contributions
- Added to a CONTRIBUTORS.md file for substantial contributions

## Questions?

If you have questions about contributing, please:

- Open an issue for discussion
- Email us at hello@thinknimble.com
- Reach out on GitHub: [@thinknimble](https://github.com/thinknimble)

Thank you for contributing to ThinkNimble Research Institute!
