import SwiftUI
import SDWebImageSwiftUI

struct MessageSelf: View {
    
//    @EnvironmentObject var viewModel: AppViewModel
    
 
    
    var message: Message
//    var myUid: String
    @State var myUid  = ""
//    var myUid = viewModel.auth.currentUser?.uid ?? "none"
    
//    init() {
//        self.myUid = v
//
//    }
    
    var body: some View {
        HStack(alignment: .bottom) {
            if message.uid == myUid {
                Spacer()
//                Text(message.text, style: .time)
//                    .font(.caption)
//                    .foregroundColor(.gray)
            } else {
                WebImage(url: URL(string: message.photoUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .mask(RoundedRectangle(cornerRadius: 48).frame(width: 30, height: 30))
            }
            
            VStack(alignment: message.uid == myUid ? .trailing : .leading, spacing: 5) {
                Text(message.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 4)
                Text(message.text)
                    
//                Text(message.timestamp, style: .time)
//                    .font(.caption)
//                    .foregroundColor(.gray)
            }.padding(10)
                .foregroundColor(.white)
                .background(message.uid == myUid ? Color.blue : Color.green)
                .cornerRadius(10)
            
//            if !message.isSentByCurrentUser {
//                Spacer()
//            }
        }
    }
}


struct MessageSelf_Previews: PreviewProvider {
    static var previews: some View {
        MessageSelf(message: Message(
            id: UUID(),
            uid: "ыоваол74356893ишоурв",
            text: "Str dsgfjhsd hjsdhf sdhdhsjfhdsjhfksd s",
            displayName: "Ктото",
            photoUrl: "https://google.com"
        ))
    }
}
