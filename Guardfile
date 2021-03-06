# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rsspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separetly)
#  * 'just' rspec: 'rspec'

# Watch the bundle for updates:
guard :bundler do
  watch('Gemfile')
end

# Start explicitly the Spring preloader & watch for files that may need Spring to refresh itself:
guard :spring, bundler: true do
  watch('Gemfile.lock')
  watch(%r{^config/})
  watch(%r{^spec/(support|factories)/})
  watch(%r{^spec/factory.rb})
end

# rubocop_options = {
#   cmd: 'rubocop',
#   # With fuubar:
#   cli: '-E -P -S -f fu'
# }

# Watch Ruby files for changes and run RuboCop:
# [See https://github.com/yujinakayama/guard-rubocop for all options]
# guard :rubocop, rubocop_options do
#   watch(/.+\.rb$/)
#   watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
# end

rspec_options = {
  cmd: 'rspec',
  # Exclude performance tests:
  cmd_additional_args: ' --color -f progress --order rand -t ~type:performance',
  # Zeus only: the following option must match the path in engine_plan.rb
  # results_file: Rails.root.join('tmp', 'guard_rspec_results.txt'),
  all_after_pass: false,
  failed_mode: :focus
}

guard :rspec, rspec_options do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper)  { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Rails files
  rails = dsl.rails(view_extensions: %w(erb haml slim))
  dsl.watch_spec_files_for(rails.app_files)
  dsl.watch_spec_files_for(rails.views)

  # Watch any spec files for changes:
  watch( %r{^spec\/.+_spec\.rb$} )

  # Watch factories and launch the specs for their corresponding model:
  watch( %r{^spec\/factories\/(.+)\.rb$} ) do |m|
    Dir[ "spec/models/#{m[1]}*spec.rb" ]
  end

  # Watch app sub-sub-dirs and spawn a corresponding spec re-check:
  watch( %r{^app\/(.+)\/(.+)\.rb$} ) do |m|
    Dir[ "spec/#{m[1]}/#{m[2]}*spec.rb" ]
  end

  # Watch rails-specific controller files:
  watch(rails.controllers) do |m|
    [
      rspec.spec.("routing/#{m[1]}_routing"),
      rspec.spec.("controllers/#{m[1]}_controller"),
      rspec.spec.("acceptance/#{m[1]}")
    ]
  end

  # Rails config changes
  watch(rails.spec_helper)     { rspec.spec_dir }
  watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
  watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

  # Capybara features specs
  watch(rails.view_dirs)     { |m| rspec.spec.("features/#{m[1]}") }
  watch(rails.layouts)       { |m| rspec.spec.("features/#{m[1]}") }
end
