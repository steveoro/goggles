# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dj_mon"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Akshay Rawat", "Timo Schilling", "Stefano Alloro"]
  s.date = "2013-12-09"
  s.description = "A Rails engine based frontend for Delayed Job"
  s.email = ["projects@akshay.cc"]
  s.files = ["app/assets", "app/assets/stylesheets", "app/assets/stylesheets/dj_mon", "app/assets/stylesheets/dj_mon/dj_mon.css", "app/assets/javascripts", "app/assets/javascripts/dj_mon", "app/assets/javascripts/dj_mon/dj_mon.js", "app/controllers", "app/controllers/dj_mon", "app/controllers/dj_mon/dj_reports_controller.rb", "app/models", "app/models/dj_mon", "app/models/dj_mon/dj_report.rb", "app/views", "app/views/layouts", "app/views/layouts/dj_mon.html.haml", "app/views/dj_mon", "app/views/dj_mon/dj_reports", "app/views/dj_mon/dj_reports/index.html.haml", "lib/dj_mon.rb", "lib/dj_mon", "lib/dj_mon/backend.rb", "lib/dj_mon/backend", "lib/dj_mon/backend/activerecord.rb", "lib/dj_mon/backend/mongoid.rb", "lib/dj_mon/engine.rb", "lib/dj_mon/version.rb", "config/routes.rb", "vendor/assets", "vendor/assets/stylesheets", "vendor/assets/stylesheets/dj_mon", "vendor/assets/stylesheets/dj_mon/bootstrap.css", "vendor/assets/javascripts", "vendor/assets/javascripts/dj_mon", "vendor/assets/javascripts/dj_mon/bootstrap_tooltip.js", "vendor/assets/javascripts/dj_mon/bootstrap_popover.js", "vendor/assets/javascripts/dj_mon/bootstrap_modal.js", "vendor/assets/javascripts/dj_mon/mustache.js", "vendor/assets/javascripts/dj_mon/bootstrap_tab.js", "MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]
  s.homepage = "https://github.com/akshayrawat/dj_mon"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "A Frontend for Delayed Job."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1"])
      s.add_runtime_dependency(%q<haml>, [">= 3.1"])
      s.add_development_dependency(%q<delayed_job_active_record>, [">= 0"])
      s.add_development_dependency(%q<delayed_job_mongoid>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<devise>, [">= 0"])
      s.add_development_dependency(%q<devise-i18n>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.1"])
      s.add_dependency(%q<haml>, [">= 3.1"])
      s.add_dependency(%q<delayed_job_active_record>, [">= 0"])
      s.add_dependency(%q<delayed_job_mongoid>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<devise>, [">= 0"])
      s.add_dependency(%q<devise-i18n>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1"])
    s.add_dependency(%q<haml>, [">= 3.1"])
    s.add_dependency(%q<delayed_job_active_record>, [">= 0"])
    s.add_dependency(%q<delayed_job_mongoid>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<devise>, [">= 0"])
    s.add_dependency(%q<devise-i18n>, [">= 0"])
  end
end
