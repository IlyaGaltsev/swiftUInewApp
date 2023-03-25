import SwiftUI
import Firebase
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
}

@main
struct YourApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if (FirebaseManager.shared.auth.currentUser != nil) {
                    HomeView(viewModel: MainTabbarViewModel(user: FirebaseManager.shared.auth.currentUser!))
                } else {
                    SignInView()
                }
               
            }
        }
    }
}
