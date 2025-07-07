Tencent Gift AR SDK provides demos suitable for different development platforms. This article will mainly introduce how to quickly run through the iOS Demo of the  Gift AR SDK.

## Environmental Requirements

- Xcode 9.0+.

- iPhone or iPad running iOS 9.0 or later.

- The project has a configured effective developer signature.


## Importing Project

Decompress the downloaded zip file, enter the TCEffectPlayerDemo_iOS directory, run `pod install` in the terminal. After successful execution, click TCEffectPlayerDemo.xcworkspace to open the demo project.

> **Note:**

> The TCMediaX, TCEffectPlayer and YTCommonXMagic libraries in Podfile may not be the latest. You can get the latest version through the official website.


## Modify Configuration

Replace the license information in the project. Open the AppDelegate.m file, find the LICENCE_URL and LICENCE_KEY fields, and replace the corresponding values with the license information of the Tencent Gift AR  SDK you applied for. The Tencent Gift AR SDK supports applying for a trial License for experience. For application details, [click](https://trtc.io/document/60219?platform=ios&product=beautyar) to view.

![](https://write-document-release-1258344699.cos.ap-guangzhou.tencentcos.cn/100026789402/224e32b24b7511f0b25352540099c741.png)


## Animation Resource Configuration

> **Note:**

> If you don't need to play your own animation files, you can skip this step.


Find the Resource. Currently, add your animation resource to this directory. Meanwhile, configure the name of the animation resource to be played in the ViewController.m file.



![](https://write-document-release-1258344699.cos.ap-guangzhou.tencentcos.cn/100026789402/426672dc4b7511f08548525400454e06.png)


> **Note:**
>
> - The built-in animation files in the Demo are not bound to a License. Therefore, you can use your own License for playback experience.
> - If you want to replace your own animation, note that the License information of the animation should be consistent with the License information set in the project. Otherwise, playback will fail due to mismatched License information.


## Compile and Run

1. Ensure that the iPhone or iPad testing device has already connected normally to XCode.

2. Modify the Bundle Id corresponding to TCEffectPlayerDemo Targets to the Bundle Id you filled in when applying for the Gift AR  player License, import the certificate, and run.


   At this moment, the console will first print:

   ``` java
   TCMediaXBase setLicense authresult: 0 ,errorMsg: { }
   ```
   This indicates that the SDK license authentication has already succeeded.
   > **Note:**
   > Tencent Gift AR SDK requires network dependency for the initial license authentication. Therefore, the network needs to be connected when running the Demo at startup.
