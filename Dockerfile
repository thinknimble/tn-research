FROM ruby:3.2-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install Jekyll and dependencies
RUN bundle install

# Expose port for Jekyll server
EXPOSE 4001 35729

# Default command
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--port", "4001", "--host", "0.0.0.0"]
