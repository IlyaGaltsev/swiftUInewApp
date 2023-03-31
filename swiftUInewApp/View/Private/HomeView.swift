import SwiftUI
import Firebase

struct HomeView: View {
    
    var body: some View {
        TabView {
            
            MainMessagesView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ChatView()
                .tabItem{
                    Image(systemName: "message")
                    Text("Chat")
                }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.colorScheme, .dark)
    }
}

