import SwiftUI
import Firebase

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Hello, HOME!")
            Button{
                let firebaseAuth = Auth.auth()
                
                do {
                    try firebaseAuth.signOut()
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
        HomeView()
    }
}
