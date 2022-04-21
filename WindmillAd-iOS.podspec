#
#  Be sure to run `pod spec lint WindmillAd-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "WindmillAd-iOS"
  spec.version      = "1.4.3"
  spec.summary      = "WindSDK is a SDK from Sigmob providing AD service."
  spec.description      = <<-DESC
  WindmillAd-iOS provides ADs which include native、banner、splash、RewardVideo、intersititial etc.
                       DESC

  spec.homepage     = "http://www.sigmob.com/"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Codi" => "codi.zhao@sigmob.com" }
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = '9.0'
  spec.user_target_xcconfig =   {'OTHER_LDFLAGS' => ['-lObjC']}
  spec.source       = { :http => "https://sdkres.sigmob.cn/windmill/ios/1.4.3_6c7865f8f5fbd12dc9accf79908f974a/windmill_release_ios_1.4.3_20220420.zip" }
  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  spec.requires_arc = true
  spec.default_subspec = 'WindmillSDK'

  # 默认的核心模块
  spec.subspec 'WindmillSDK' do |ss|
    ss.frameworks = 'ImageIO','StoreKit', 'CFNetwork', 'CoreMedia', 'AdSupport', 'CoreMotion', 'MediaPlayer', 'CoreGraphics', 'AVFoundation', 'CoreLocation', 'CoreTelephony', 'SafariServices', 'MobileCoreServices', 'SystemConfiguration', 'AudioToolbox'
    ss.weak_framework = 'WebKit', 'UIKit', 'Foundation'
    ss.libraries = 'c++', 'z', 'sqlite3'
    ss.vendored_frameworks = ['windmill-sdk-ios/Core/WindMillSDK.xcframework']
    ss.preserve_paths = 'windmill-sdk-ios/Core/WindMillSDK.xcframework'
    ss.dependency 'WindmillAd-iOS/SigmobAd-iOS'
  end

  spec.subspec 'SigmobAd-iOS' do |ss|
     ss.vendored_frameworks = ['windmill-sdk-ios/Core/WindSDK.xcframework']
     ss.preserve_paths = 'windmill-sdk-ios/Core/WindSDK.xcframework'
     ss.dependency 'WindmillAd-iOS/WindFoundation'
  end

  spec.subspec 'WindFoundation' do |ss|
     ss.vendored_frameworks = ['windmill-sdk-ios/Core/WindFoundation.xcframework']
     ss.preserve_paths = 'windmill-sdk-ios/Core/WindFoundation.xcframework'
  end

  spec.subspec 'TouTiaoAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/csj/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'Ads-CN', '4.3.0.5'
  end

  spec.subspec 'AdmobAdapter' do |ss|
     ss.ios.deployment_target = '10.0'
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/admob/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'Google-Mobile-Ads-SDK', '9.3.0'
  end

  spec.subspec 'AppLovinAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/applovin/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'AppLovinSDK', '11.3.1'
  end

  spec.subspec 'MintegralAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/mintegral_global/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'MintegralAdSDK/SplashAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/BidSplashAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/InterstitialAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/InterstitialVideoAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/BidInterstitialVideoAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/NewInterstitialAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/BidNewInterstitialAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/RewardVideoAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/BidRewardVideoAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/BannerAd', '7.1.2.0'
     ss.dependency 'MintegralAdSDK/BidBannerAd', '7.1.2.0'
  end

  spec.subspec 'GDTAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/gdt/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'GDTMobSDK', '4.13.63'
  end

  spec.subspec 'IronSourceAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/ironSource/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'IronSourceSDK', '7.2.1.0'
  end

  spec.subspec 'VungleAdapter' do |ss|
     ss.ios.deployment_target = '10.0'
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/vungle/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'VungleSDK-iOS', '6.10.6'
  end

  spec.subspec 'UnityAdsAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/unity/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'UnityAds', '4.1.0'
  end

  spec.subspec 'KSAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/kuaishou/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'KSAdSDK', '3.3.22'
  end

  spec.subspec 'BaiduAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/baidu/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'BaiduMobAdSDK', '4.861'
  end

  spec.subspec 'KlevinAdapter' do |ss|
     ss.vendored_libraries = 'windmill-sdk-ios/AdNetworks/klevin/*.a'
     ss.dependency 'WindmillAd-iOS/WindmillSDK'
     ss.dependency 'KlevinAdSDK', '2.5.0.230'
  end
  
end
