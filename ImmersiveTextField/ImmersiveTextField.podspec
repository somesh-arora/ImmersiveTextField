Pod::Spec.new do |spec|

  spec.name         = "ImmersiveTextField"
  spec.version      = "1.0.0"
  spec.summary      = "ImmersiveTextField framework is powered by SwiftUI"
  spec.description  = "ImmersiveTextField framework is built to serve your TextField needs in your iOS application"
  spec.homepage     = "https://github.com/somesh-arora/ImmersiveTextField"
  spec.license      = "MIT"
  spec.author             = { "Somesh Arora" => "somesharora23@gmail.com" }
  spec.platform     = :ios, "16.4"
  spec.source       = { :git => "https://github.com/somesh-arora/ImmersiveTextField.git", :tag => spec.version.to_s }
  spec.source_files  = "ImmersiveTextField/**/*.{swift}"
  spec.swift_versions = "5.0"
end
