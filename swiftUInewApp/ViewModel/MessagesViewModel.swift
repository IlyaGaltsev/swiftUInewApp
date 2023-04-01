import Foundation
import FirebaseFirestore

class MessagesViewModel: ObservableObject {
    
    static let shared = MessagesViewModel()
    
    @Published var messages = [Message]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("messages").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.messages = documents.compactMap { (queryDocumentSnapshot) -> Message? in
                let data = queryDocumentSnapshot.data()
                
                let uid = data["uid"] as? String ?? "нет данных"
                let text = data["text"] as? String ?? "нет данных"
                let displayname = data["displayName"] as? String ?? "нет данных"
                let photoUrl = data["photoUrl"] as? String ?? "нет данных"
                
                return Message(
                    id: UUID(),
                    uid: uid,
                    text: text,
                    displayName: displayname,
                    photoUrl: photoUrl
                )
            }
        }
    }
}
