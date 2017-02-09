%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
  .env
  .env.local
).each { |path| Spring.watch(path) }
