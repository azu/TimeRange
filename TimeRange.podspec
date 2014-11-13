Pod::Spec.new do |s|
  s.name        = "TimeRange"
  s.version     = "1.1.0"
  s.summary     = "TimeRange provide check if an NSDate occurs between two other NSDates."
  s.homepage         = "https://github.com/azu/TimeRange"
  s.screenshots      = "http://monosnap.com/image/9NniA7H5i5cnpBnCnC0YU77aPnjbVY.png"
  s.license          = 'MIT'
  s.author           = {"azu" => "azuciao@gmail.com"}
  s.source           = {:git => "https://github.com/azu/TimeRange.git", :tag => s.version.to_s}
  s.social_media_url = 'https://twitter.com/azu_re'

  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files     = 'Pod/Classes'
end
