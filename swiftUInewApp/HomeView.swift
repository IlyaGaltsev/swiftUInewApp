import SwiftUI
import Firebase

struct HomeView: View {
    var viewModel: MainTabbarViewModel
    var body: some View {
        VStack {
            Text("Hello, HOME!")
            Button{
                do {
                    try FirebaseManager.shared.auth.signOut()
                } catch let signOutError as NSError {
                    print("Error signing out", signOutError)
                }
                
            } label: {
                Text("Logout").foregroundColor(Color.red)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MainTabbarViewModel(user: FirebaseManager.shared.auth.currentUser!))
    }
}
