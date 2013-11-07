# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "documatic"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Nelson", "Antonio Liccardo", "Zachris Trolin", "Stefano Alloro"]
  s.autorequire = "documatic.rb"
  s.date = "2013-11-07"
  s.description = "Forked from http://github.com/zachris/documatic. This branch simply adds default UTF-8 encoding on most of the source files and a brand new demo invoice document to test the output results. New bundler-friendly gemspecs were added also."
  s.email = ["steve.alloro@gmail.com"]
  s.extra_rdoc_files = ["README"]
  s.files = [".gitignore", ".project", "Gemfile", "LICENSE", "README", "README.md", "Rakefile", "documatic.gemspec", "lib/documatic.rb", "lib/documatic/component.rb", "lib/documatic/formatter/open_document.rb", "lib/documatic/init.rb", "lib/documatic/open_document_spreadsheet/component.rb", "lib/documatic/open_document_spreadsheet/helper.rb", "lib/documatic/open_document_spreadsheet/template.rb", "lib/documatic/open_document_text/component.rb", "lib/documatic/open_document_text/helper.rb", "lib/documatic/open_document_text/partial.rb", "lib/documatic/open_document_text/template.rb", "lib/documatic/version.rb", "tutorials/invoice_demo/invoice_en.odt", "tutorials/invoice_demo/invoice_report.rb", "tutorials/multi/multi.odt", "tutorials/multi/multi.rb", "tutorials/multi/partials/albums.odt", "tutorials/multi/partials/dvds.odt", "tutorials/partials_demo/demo.rb", "tutorials/partials_demo/master.odt", "tutorials/partials_demo/partial.odt", "tutorials/sales_report/sales_report.odt", "tutorials/sales_report/sales_report.rb", "tutorials/tutorial/spreadsheet.rb", "tutorials/tutorial/template.ods", "tutorials/tutorial/template.odt", "tutorials/tutorial/tutorial.rb"]
  s.homepage = "http://github.com/fasar-sw/documatic"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Documatic: ruby reports templating of Open Document Text and Spreadsheet"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruport>, [">= 0"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0"])
    else
      s.add_dependency(%q<ruport>, [">= 0"])
      s.add_dependency(%q<rubyzip>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruport>, [">= 0"])
    s.add_dependency(%q<rubyzip>, [">= 0"])
  end
end
