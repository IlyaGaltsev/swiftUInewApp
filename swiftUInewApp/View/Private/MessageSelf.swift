import SwiftUI

struct MessageSelf: View {
    
    var message: Message
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .bottom) {
                
                AsyncImage(
                    url: URL(string: message.photoUrl),
                    
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }, placeholder: {
                        Color.gray
                    })
                .frame(width: 48, height: 48)
                .mask(RoundedRectangle(cornerRadius: 48).frame(width: 48, height: 48))
                
                VStack(alignment: .leading) {
                    Text(message.displayName)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .padding(.bottom, 1)
                    
                    Text(message.text)
                        .font(.system(size: 16))
                    
                }.padding(12)
                    .background(Color.orange)
                    .cornerRadius(14)
                
            }
            
        }
        
    }
}

struct MessageSelf_Previews: PreviewProvider {
    static var previews: some View {
        MessageSelf(message: Message(
            id: UUID(),
            uid: "ыоваол74356893ишоурв",
            text: "Str dsgfjhsd hjsdhf sdhdhsjfhdsjhfksd sduhfkjhsdb sdjhfisd cjkhdufhsnd kjsdhfj jksdhjkf j hsd jsdu jskdufhsdjn judsh jksdh sjkd bjbkjhs bhsd  ghsdjh oisdb hksd  oubsdk jnbsduo ing",
            displayName: "Ктото",
            photoUrl: "https://google.com"
        ))
    }
}
