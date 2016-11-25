#
# Be sure to run `pod lib lint MVMaterialToggleButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MVMaterialToggleButton'
  s.version          = '0.1.0'
  s.summary          = 'UIButton subclass for toggle action with Material Design effects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A drop-in subclass of UIButton to mimic Material Design's shadow effect with Toggle actions.
                       DESC

  s.homepage         = 'https://github.com/TheMrugraj/MVMaterialToggleButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mrugrajsinh Vansadia' => 'mrugrajsinh@gmail.com' }
  s.source           = { :git => 'https://github.com/TheMrugraj/MVMaterialToggleButton.git', :tag => s.version.to_s, :commit => "4a48d41386d3ab590b4dc54486e5a6582b8c545a"}
  # s.social_media_url = 'https://twitter.com/TheMrugraj'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MVMaterialToggleButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MVMaterialToggleButton' => ['MVMaterialToggleButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
