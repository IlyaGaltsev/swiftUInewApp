import SwiftUI
import Firebase

struct HomeView: View {
    var viewModel: MainTabbarViewModel
    
    var body: some View {
        TabView {
            
            MainMessagesView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MainTabbarViewModel(user: FirebaseManager.shared.auth.currentUser!))
    }
}
