import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // Provide your Google Maps API Key here
        GMSServices.provideAPIKey("AIzaSyBujtiCvaPNc8cTkh7cDH7j4XxE2MvbrvA")

        // Register Flutter plugins
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}