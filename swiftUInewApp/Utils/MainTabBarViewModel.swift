import Foundation
import FirebaseAuth

class MainTabbarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
