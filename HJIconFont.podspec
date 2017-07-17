Pod::Spec.new do |s|
  s.name         = "HJIconFont"
  s.version      = "1.0.0"
  s.summary      = "iconfont支持库"
  s.homepage     = "https://github.com/HaijunWei/HJIconFont.git"
  s.license      = "MIT"
  s.author       = { "Haijun" => "whj929159021@hotmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/HaijunWei/HJIconFont.git" }
  s.source_files = "HJIconFont/**/*.{h,m}"
  s.requires_arc = true
end
