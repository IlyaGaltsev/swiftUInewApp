import Foundation

class MessagesViewModel: ObservableObject {
    
    static let  shared = MessagesViewModel()
    
    var messages = [
        Message(
            uid: "String",
            text: "tr dsgfjhsd hjsdhf sdhdhsjfhdsjhfksd sduhfkjhsdb sdjhfisd cjkhdufhsnd kjsdhfj jksdhjkf j hsd jsdu jskdufhsdjn judsh jksdh sjkd bjbkjhs bhsd  ghsdjh oisdb hksd",
            displayName: "user93242",
            photoUrl: "https://google.com"
        ),
        Message(
            uid: "22",
            text: "tr dsgfjhsd hjsdhf sdhdhsjfhdsjhfksd sduhfkjhsdb sdjhfisd cjkhdufhsnd kjsdhfj jksdhjkf j hsd jsdu jskdufhsdjn judsh jksdh sjkd bjbkjhs bhsd  ghsdjh oisdb hksd",
            displayName: "user93458333",
            photoUrl: "https://google.com"
        ),
        Message(
            uid: "33",
            text: "tr dsgfjhsd hjsdhf sdhdhsjfhdsjhfksd sduhfkjhsdb sdjh",
            displayName: "user93458",
            photoUrl: "https://google.com"
        )
    ]
}
