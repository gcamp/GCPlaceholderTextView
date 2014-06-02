Pod::Spec.new do |s|
  s.name         = "GCPlaceholderTextView"
  s.version      = "1.0.1"
  s.summary      = "A subclass of UITextView that allow a placeholder."
  s.homepage     = "http://gcamp.ca/"
  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = { "Guillaume Campagna" => "http://gcamp.ca/" }
  s.source       = { :git => "git@github.com:gcamp/GCPlaceholderTextView.git", :tag => s.version.to_s }
  s.platform     = :ios, '5.1.1'
  s.source_files = 'GCPlaceholderTextView/*.{h,m}'
  s.requires_arc = true
end
