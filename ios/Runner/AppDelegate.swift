import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let batteryChannel = FlutterMethodChannel(name: "by.grodno.vasili.flutter_mentoring/platformName",
                                                  binaryMessenger: controller.binaryMessenger)
        batteryChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
            guard call.method == "getPlatformName" else {
                result(FlutterMethodNotImplemented)
                return
            }
            let version = UIDevice.current.systemVersion
            result("iOS " + version)
        })
        
        
        GeneratedPluginRegistrant.register(with: self)
        
        GMSServices.provideAPIKey("AIzaSyBTUH2dhArTcqaErMpHxBNxf2MdHeOqqFo")
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
