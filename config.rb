###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

set :relative_links, true

# helpers do
#   def active_class(page_url)
#     current_page.url == page_url ? "active" : ''
#   end
# end


activate :i18n, :langs => ['en', 'zh-CN'], :lang_map => {'zh-CN': 'cn'}


activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "{title}.html"
  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}-{title}.html"
  blog.taglink = "tags/{tag}.html"
  blog.layout = "article_layout"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end

# activate :external_pipeline,
#          name: :webpack,
#          command: build? ?
#          "./node_modules/webpack/bin/webpack.js --bail -p" :
#          "./node_modules/webpack/bin/webpack.js --watch -d --progress --color",
#          source: ".tmp/dist",
#          latency: 1

activate :external_pipeline,
           name: :webpack,
           command: build? ? "yarn run build" : "yarn run start",
           source: ".tmp/dist",
           latency: 1


# deploy to github pages
activate :deploy do |deploy|
    deploy.deploy_method = :git

    deploy.remote = "git@github.com:midwinterlong/midwinterlong.github.io.git"
    deploy.branch = "master"
end