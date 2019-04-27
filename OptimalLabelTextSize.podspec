#
# Be sure to run `pod lib lint OptimalLabelTextSize.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OptimalLabelTextSize'
  s.version          = '1.0.0'
  s.summary          = 'This is lib will allow you easy to adjust Text Size Label for all iPhone and iPad divices'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
I had a need in optimize size font for different i-Device. I couldn't search lib which is fully task. So I created lib with IBDesignable for visual resulut. It helped me to shorten the time
DESC

  s.homepage         = 'https://github.com/snazarovone/OptimalLabelTextSize'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'snazarovone' => 'snazarovone@icloud.com' }
  s.source           = { :git => 'https://github.com/snazarovone/OptimalLabelTextSize.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = "5.0"

  s.source_files = 'OptimalLabelTextSize/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OptimalLabelTextSize' => ['OptimalLabelTextSize/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'Device', '~> 3.1.2'
end
