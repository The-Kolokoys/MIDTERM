import Flutter
import UIKit
import GoogleMaps

GMSServices.provideAPIKey("AIzaSyBujtiCvaPNc8cTkh7cDH7j4XxE2MvbrvA")

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
