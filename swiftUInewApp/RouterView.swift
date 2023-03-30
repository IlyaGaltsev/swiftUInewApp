import SwiftUI
import FirebaseAuth

struct RouterView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if (viewModel.signedIn) {
                HomeView()
            } else {
                AutorizationView()
            }
            
        }.onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}


