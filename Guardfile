guard 'bundler' do
  watch('Gemfile')
end

guard 'minitest' do
  watch(%r|^test/unit/test_(.*)\.rb|)
  watch(%r|^lib/*\.rb|){'test'}
  watch(%r{^lib/.*/([^/]+)\.rb$}){|m| "test/unit/test_#{m[1]}.rb"}
  watch(%r{^lib/.*/([^/]+)_presenter\.rb$}){|m| "test/unit/test_#{m[1]}_presenter.rb"}
  watch(%r|^test/helper\.rb|){'test'}
end
