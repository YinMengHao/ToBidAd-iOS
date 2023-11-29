#
#  Be sure to run `pod spec lint ToBidAd-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = 'ToBid-iOS-Global'
  spec.version      = '3.2.2'
  spec.summary      = 'ToBid-iOS is a SDK from Sigmob providing AD service.'
  spec.description      = <<-DESC
  ToBid-iOS provides ADs which include native、banner、splash、RewardVideo、Interstitial etc.
                       DESC

  spec.homepage     = 'https://www.sigmob.com/'
  spec.license      = { :type => 'MIT' }
  spec.author       = { 'Codi' => 'codi.zhao@sigmob.com' }
  spec.platform     = :ios, '9.0'
  spec.ios.deployment_target = '9.0'
  spec.source       = { :http => "https://sdkres.sigmob.cn/ToBid/ios/3.2.2_3f4690aa43de9c09935c1e933560f04d/tobid_release_ios_global_3.2.2_20231129.zip" }
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
   #   ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/pangle/*.xcframework'
   #   ss.resource = 'tobid-sdk-ios-global/AdNetworks/pangle/*.bundle'
   #   ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/pangle/**/*'
   #   ss.frameworks = "UIKit", "WebKit", "MediaPlayer","AdSupport","CoreMedia","AVFoundation","CoreTelephony","StoreKit","SystemConfiguration","MobileCoreServices","CoreMotion","Accelerate","AudioToolbox","JavaScriptCore","Security","AudioToolbox","CoreGraphics","CoreAudioTypes"
   #   ss.weak_frameworks = 'AppTrackingTransparency', 'DeviceCheck', 'CoreML'
   #   ss.libraries = 'c++', 'resolv', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
     ss.dependency 'Ads-Global', '5.5.0.5' 

  end

  spec.subspec 'AdmobAdapter' do |ss|
     ss.ios.deployment_target = '11.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/admob/*.a'
     # ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/admob/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/admob/**/*'
     # ss.frameworks = "AudioToolbox","AVFoundation","CFNetwork","CoreGraphics","CoreMedia","CoreTelephony","CoreVideo","MediaPlayer","MessageUI","MobileCoreServices","QuartzCore","Security","StoreKit","SystemConfiguration"
     # ss.libraries = 'z','sqlite3'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
     ss.dependency 'Google-Mobile-Ads-SDK', '10.13.0'
  end

  spec.subspec 'AppLovinAdapter' do |ss|
     ss.platform     = :ios, '11.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/applovin/*.a'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/applovin/**/*'
     ss.dependency 'AppLovinSDK', '12.0.0'
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
     ss.platform     = :ios, '10.0'
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
     ss.ios.deployment_target = '10.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/unity/*.a'
     # ss.ios.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/unity/UnityAds.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/unity/**/*'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
     ss.dependency 'UnityAds', '4.9.2'
  end
  
  spec.subspec 'TouTiaoAdapter' do |ss|
     ss.ios.deployment_target = '10.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/csj/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/csj/*.xcframework'
     ss.resource = 'tobid-sdk-ios-global/AdNetworks/csj/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/csj/**/*'
     ss.frameworks = 'UIKit', 'MapKit', 'WebKit', 'MediaPlayer', 'CoreLocation', 'AdSupport', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'StoreKit', 'SystemConfiguration', 'MobileCoreServices', 'CoreMotion', 'Accelerate','AudioToolbox','JavaScriptCore','Security','CoreImage','AudioToolbox','ImageIO','QuartzCore','CoreGraphics','CoreText',"DeviceCheck"
     ss.weak_frameworks = 'AppTrackingTransparency', 'DeviceCheck'
     ss.libraries = 'c++', 'resolv', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end
  spec.subspec 'CSJMediationAdapter' do |ss|
    ss.ios.deployment_target = '10.0'
    ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/gromore/*.a'
    ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/gromore/*.xcframework'
    ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/gromore/**/*'
    ss.frameworks = 'UIKit', 'MapKit', 'WebKit', 'MediaPlayer', 'CoreLocation', 'AdSupport', 'CoreMedia', 'AVFoundation', 'CoreTelephony', 'StoreKit', 'SystemConfiguration', 'MobileCoreServices', 'CoreMotion', 'Accelerate','AudioToolbox','JavaScriptCore','Security','CoreImage','AudioToolbox','ImageIO','QuartzCore','CoreGraphics','CoreText',"DeviceCheck"
    ss.weak_frameworks = 'AppTrackingTransparency', 'DeviceCheck'
    ss.libraries = 'c++', 'resolv', 'z', 'sqlite3', 'bz2', 'xml2', 'iconv', 'c++abi'
    ss.dependency 'ToBid-iOS-Global/TouTiaoAdapter'
  end


  spec.subspec 'GDTAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/gdt/*.a', 'tobid-sdk-ios-global/AdNetworks/gdt/lib/*.a'
     ss.source_files = 'tobid-sdk-ios-global/AdNetworks/gdt/lib/*.h'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/gdt/**/*'
     ss.frameworks = "StoreKit","Security","CoreTelephony","AdSupport","CoreLocation","QuartzCore","SystemConfiguration","AVFoundation"
     ss.weak_framework = 'WebKit'
     ss.libraries = 'z', 'xml2'
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end


  spec.subspec 'KSAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/kuaishou/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/kuaishou/*.xcframework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/kuaishou/**/*'
     ss.frameworks = "Foundation","UIKit","MobileCoreServices","CoreGraphics","Security","SystemConfiguration","CoreTelephony","AdSupport","CoreData","StoreKit","AVFoundation","MediaPlayer","CoreMedia","WebKit","Accelerate","CoreLocation","AVKit","MessageUI","QuickLook","AudioToolBox","JavaScriptCore","CoreMotion"
     ss.libraries = "z","resolv.9","sqlite3","c++","c++abi"
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'BaiduAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/baidu/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/baidu/*.framework'
     ss.resource  = 'tobid-sdk-ios-global/AdNetworks/baidu/*.bundle'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/baidu/**/*'
     ss.frameworks = "CoreLocation","SystemConfiguration","CoreGraphics","CoreMotion","CoreTelephony","AdSupport","SystemConfiguration","QuartzCore","WebKit","MessageUI","SafariServices","AVFoundation","EventKit","QuartzCore","CoreMedia","StoreKit"
     ss.libraries = "c++"
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'KlevinAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/klevin/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/klevin/*.framework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/klevin/**/*'
     ss.frameworks = "StoreKit","SystemConfiguration","CoreTelephony","AVKit","AVFoundation","CoreMedia"
     ss.weak_frameworks = "AdSupport","AppTrackingTransparency","WebKit"
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'AdScopeAdapter' do |ss|
     ss.platform     = :ios, '9.0'
     ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/adscope/*.a'
     ss.vendored_frameworks = 'tobid-sdk-ios-global/AdNetworks/adscope/*.framework'
     ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/adscope/**/*'
     ss.frameworks = "AdSupport","AVFoundation","AVKit","Accelerate","AudioToolbox","AppTrackingTransparency","CoreData","CoreLocation","CoreMedia","CoreMotion","CoreGraphics","CoreTelephony","CoreImage","CoreText","Foundation","MediaPlayer","MessageUI","MobileCoreServices","MapKit","QuartzCore","QuickLook","SystemConfiguration","Security","StoreKit","WebKit","UIKit","ImageIO","SafariServices","JavaScriptCore","DeviceCheck"
     ss.libraries = "z","c++","sqlite3","xml2","bz2","c++abi","resolv.9","iconv","c"
     ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end

  spec.subspec 'InMobiAdapter' do |ss|
   ss.platform     = :ios, '11.0'
   ss.vendored_libraries = 'tobid-sdk-ios-global/AdNetworks/inMobi/*.a'
   ss.preserve_paths = 'tobid-sdk-ios-global/AdNetworks/inMobi/**/*'
   ss.dependency 'InMobiSDK', '10.5.8'
   ss.dependency 'ToBid-iOS-Global/ToBidSDK'
  end


end
