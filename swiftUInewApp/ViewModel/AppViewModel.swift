import Foundation
import Firebase
import FirebaseFirestore

class AppViewModel: ObservableObject {
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    var firestore: AnyObject {
        return auth.currentUser!
    }
    
//    firestore.collection("messages").getDocuments {documentSnapshot, error in
//        if let error = error {
//            pront("FATALITY,\(error)")
//        }
//
//        documentSnapshot?.documents.forEach({snapshot in
//            print(snapshot.data())
//            users.append(.init(data: snapshot.data()))
//        }
//    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email,
                    password: password) { [weak self]  result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self]  result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}