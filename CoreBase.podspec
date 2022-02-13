Pod::Spec.new do |spec|
  spec.platform = :ios
  spec.ios.deployment_target = '9.0'
  spec.name         = "CoreBase"
  spec.summary      = "CoreBase framework for Base Repository"
  spec.version      = "1.0.0"
  spec.requires_arc = true

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "ArifRach" => "Arifrach31@gmail.com" }

  spec.homepage     = "https://github.com/arifrach31/CoreBase"
  spec.source       = { :git => "https://github.com/arifrach31/CoreBase.git", :tag => "#{spec.version}" }

  spec.framework = "UIKit"

  spec.source_files = "CoreBase/**/*.{swift}"
  
  spec.dependency 'Moya', '~> 13.0.1'
  spec.dependency 'ObjectMapper'
  spec.dependency 'RxCocoa'
  spec.dependency 'netfox'

  spec.swift_version = "5.1"
end
