# GitHub Actions Setup for Writing Style Reviews

This repository includes an automated writing style review system that uses Claude AI to review markdown content in pull requests.

## How It Works

When you open a PR that modifies files in `_notes/`, `_essays/`, or `_posts/`, a GitHub Action automatically:

1. Detects which markdown files changed
2. Sends them to Claude with the writing-style-reviewer agent prompt
3. Posts detailed review comments on the PR
4. Provides critical but constructive feedback on writing quality

## Setup Instructions

### 1. Add Anthropic API Key to Repository Secrets

1. Go to your repository settings
2. Navigate to **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Name: `ANTHROPIC_API_KEY`
5. Value: Your Anthropic API key (get one at https://console.anthropic.com/)
6. Click **Add secret**

### 2. Enable GitHub Actions

The workflow file is already in `.github/workflows/writing-review.yml`. It will automatically run on PRs that modify markdown files in content directories.

### 3. Grant Permissions (if needed)

The action needs `pull-requests: write` permission to post comments. This is configured in the workflow file and should work automatically in most setups.

## Usage

Simply open a PR that modifies markdown files in:
- `_notes/`
- `_essays/`
- `_posts/`

The review will post as a comment within a few minutes.

## Cost

Reviews cost approximately $0.01-0.10 per file depending on length. Claude Sonnet 4.5 is used for high-quality reviews.

## Customizing the Review Agent

The review behavior is controlled by `.claude/agents/writing-style-reviewer.md`. To modify:

1. Edit the agent definition file
2. Commit changes
3. Future PRs will use the updated agent

## Disabling Reviews

To disable automatic reviews:

1. Delete or rename `.github/workflows/writing-review.yml`
2. Or modify the `paths` filter to exclude certain directories

## Troubleshooting

### Review didn't run
- Check that your PR modifies `.md` files in content directories
- Verify `ANTHROPIC_API_KEY` is set in repository secrets
- Check GitHub Actions tab for error logs

### Review failed
- Check Actions logs for detailed error messages
- Verify API key is valid and has sufficient credits
- Ensure the agent definition file exists at `.claude/agents/writing-style-reviewer.md`

### Review quality issues
- Modify the agent definition in `.claude/agents/writing-style-reviewer.md`
- Test changes locally using the agent before committing
- Adjust the prompt to emphasize or de-emphasize certain aspects

## Manual Review

You can also use the writing-style-reviewer agent manually through Claude Code by invoking it with any markdown file content.
