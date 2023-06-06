#
#  Be sure to run `pod spec lint ToBidAd-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = 'ToBid-iOS-Global'
  spec.version      = '2.10.01'
  spec.summary      = 'ToBid-iOS is a SDK from Sigmob providing AD service.'
  spec.description      = <<-DESC
  ToBid-iOS provides ADs which include native、banner、splash、RewardVideo、Interstitial etc.
                       DESC

  spec.homepage     = 'https://www.sigmob.com/'
  spec.license      = { :type => 'MIT' }
  spec.author       = { 'Codi' => 'codi.zhao@sigmob.com' }
  spec.platform     = :ios, '9.0'
  spec.ios.deployment_target = '9.0'
  spec.source       = { :http => 'https://sdkres.sigmob.cn/ToBid/ios/2.10.0_9035574add7b48c7c991a68ab9660e91/tobid_release_ios_global_2.10.0_20230605.zip' }
  spec.xcconfig = { 'VALID_ARCHS' => 'armv7 arm64 x86_64','VALID_ARCHS[sdk=iphoneos*]' => 'armv7 arm64','VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64', 'OTHER_LDFLAGS' => ['-lObjC'] }
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.requires_arc = true
  spec.default_subspec = 'ToBidSDK'

  # 默认的核心模块
  spec.subspec 'ToBidSDK' do |ss|
    ss.frameworks = 'ImageIO','StoreKit', 'CFNetwork', 'CoreMedia', 'AdSupport', 'CoreMotion', 'MediaPlayer', 'CoreGraphics', 'AVFoundation', 'CoreLocation', 'CoreTelephony', 'SafariServices', 'MobileCoreServices', 'SystemConfiguration', 'AudioToolbox'
    ss.weak_framework = 'WebKit', 'UIKit', 'Foundation'
    ss.libraries = 'c++', 'z', 'sqlite3'
    ss.vendored_frameworks = ['tobid-sdk-ios-global/Core/*.xcframework']
    ss.preserve_paths = 'tobid-sdk-ios-global/Core/**/*'
  end

  spec.subspec 'PangleAdapter' do |ss|
     ss.ios.deployment_target = '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/pangle/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/pangle/*.xcframework'
     ss.resource = 'tobid-sdk-ios-global/AdNetworks/pangle/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/pangle/**/*'
     ss.frameworks = 'UIKit', 'MapKit', 'WebKit', 'MediaPlayer', 'CoreLocation', 'AdSupport', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'StoreKit', 'SystemConfiguration', 'MobileCoreServices', 'CoreMotion', 'Accelerate','AudioToolbox','JavaScriptCore','Security','CoreImage','AudioToolbox','ImageIO','QuartzCore','CoreGraphics','CoreText'
     ss.weak_frameworks = 'AppTrackingTransparency', 'DeviceCheck', 'CoreML'
     ss.libraries = 'c++', 'resolv', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'AdmobAdapter' do |ss|
     ss.ios.deployment_target = '10.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/admob/*.a'
     # ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/admob/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/admob/**/*'
     # ss.frameworks = "AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","CoreTelephony","CoreVideo","MediaPlayer","MessageUI","MobileCoreServices","QuartzCore","Security","StoreKit","SystemConfiguration"
     # ss.libraries = 'z','sqlite3'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
     ss.dependency 'Google-Mobile-Ads-SDK', '10.4.0' 
  end

  spec.subspec 'AppLovinAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/applovin/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/applovin/*.xcframework'
     ss.resource  = 'tobid-sdk-ios-global/AdNetworks/applovin/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/applovin/**/*'
     ss.frameworks = "AdSupport","AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","CoreMotion","CoreTelephony","MessageUI","SafariServices","StoreKit","SystemConfiguration","UIKit","WebKit"
     ss.weak_framework = 'AppTrackingTransparency'
     ss.libraries = "z","sqlite3","xml2"
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'MintegralAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/mintegral-global/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/mintegral-global/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/mintegral-global/**/*'
     ss.frameworks = "SystemConfiguration","CoreGraphics","Foundation","UIKit","AdSupport","StoreKit","QuartzCore","CoreTelephony","MobileCoreServices","Accelerate","AVFoundation","WebKit"
     ss.weak_framework = 'AppTrackingTransparency'
     ss.libraries = 'z'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'IronSourceAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/ironSource/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/ironSource/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/ironSource/**/*'
     ss.frameworks = "AdSupport","AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreLocation","CoreMedia","CoreTelephony","CoreVideo","Foundation","MobileCoreServices","QuartzCore","Security","StoreKit","SystemConfiguration"
     ss.libraries = "z"
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'VungleAdapter' do |ss|
     ss.platform     = :ios, '10.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/vungle/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/vungle/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/vungle/**/*'
     ss.frameworks = "AdSupport","AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","MediaPlayer","QuartzCore","StoreKit","SystemConfiguration"
     ss.weak_frameworks = "WebKit","UIKit","Foundation"
     ss.libraries = "z"
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'UnityAdsAdapter' do |ss|
     ss.platform = :ios
     ss.ios.deployment_target = '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/unity/*.a'
     # ss.ios.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/unity/UnityAds.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/unity/**/*'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
     ss.dependency 'UnityAds', '4.7.1'
  end
  
end
