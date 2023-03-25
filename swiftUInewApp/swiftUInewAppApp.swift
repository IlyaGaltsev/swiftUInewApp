import SwiftUI
import Firebase
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
        
        return true
    }
}

@main
struct YourApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    var user = Auth.auth().currentUser;
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if (FirebaseManager.shared.auth.currentUser != nil) {
                    HomeView()
                } else {
                    SignInView()
                }
               
            }
        }
    }
}
