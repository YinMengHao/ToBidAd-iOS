# WindmillAd-iOS

## How To Get Started

+ [Download SigmobAd-iOS](http://www.sigmob.com/)

+ Check out the [documentation](http://docs.sigmob.cn/#/sdk/SDK%E6%8E%A5%E5%85%A5/ios/) for a comprehensive look at all of the APIs available in SigmobAd-iOS


## Installation with CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like Bytedance-UnionAD in your projects. You can install it with the following command:
```ruby
$ gem install cocoapods
```

### Podfile

To integrate Bytedance-UnionAD into your Xcode project using CocoaPods, specify it in your **Podfile**:
```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'

target 'TargetName' do
pod 'ToBid-iOS'
end
```
Then, run the following command:
```ruby
$ pod install
```

Pod access is only supported after **version 1982**

If you want to get Bytedance-UnionAD before version 1982 ，Please go to [union](http://ad.toutiao.com/union/media) for more information.



ToBid 做为聚合SDK目前支持开屏广告、Banner广告、Native广告、激励视频广告、插屏广告，同时支持热插拔模式。我们为每个广告渠道提供了一个静态库.a文件的适配器。

<font Color=red>如果需要使用某个渠道，需要将对应的渠道SDK和我们提供的.a适配器一同加入到工程。</font>

在podfile文件中添加:

```objective-c
#核心库,必须添加
pod 'ToBid-iOS'
  
# 各平台的Adapter和sdk根据需要自行选择导入，参考下方PodCode
```

| network    | podCode                           |
| ---------- | --------------------------------- |
| 穿山甲     | pod 'ToBid-iOS/TouTiaoAdapter'    |
| Admob      | pod 'ToBid-iOS/AdmobAdapter'      |
| Applovin   | pod 'ToBid-iOS/AppLovinAdapter'   |
| Mintegral  | pod 'ToBid-iOS/MintegralAdapter'  |
| 腾讯广告   | pod 'ToBid-iOS/GDTAdapter'        |
| IronSource | pod 'ToBid-iOS/IronSourceAdapter' |
| Vungle     | pod 'ToBid-iOS/VungleAdapter'     |
| UnityAds   | pod 'ToBid-iOS/UnityAdsAdapter'   |
| 快手       | pod 'ToBid-iOS/KSAdapter'         |
| 百度       | pod 'ToBid-iOS/BaiduAdapter'      |
| 游可赢     | pod 'ToBid-iOS/KlevinAdapter'     |

主要由于Vungle和Admob在通过pod install时要求最低platform: 10;

当导入某个适配器时，会自动通过pod下载对应渠道的SDK，由于Adapter和第三方广告SDK会存在版本兼容问题，所以我们建议通过pod Adapter的方式去依赖第三方广告SDK来确保不会有任何的版本兼容问题。

如果您想要引入特定版本的SDK则需要在pod 语句后面添加版本号(以1.0.0版本为例)、例如: pod 'ToBid-iOS', '1.0.0'

## Author

Codi

## License

SigmobAd-iOS is available under the MIT license. See the LICENSE file for more info.

