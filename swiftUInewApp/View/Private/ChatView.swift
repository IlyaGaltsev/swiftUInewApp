//
//  ChatView.swift
//  swiftUInewApp
//
//  Created by Илья on 31.03.2023.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var messagesViewModel = MessagesViewModel()
    
    let layout = [GridItem(.adaptive(minimum: UIScreen.main.bounds.width ))]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
           
                
                LazyVGrid(columns: layout, alignment: .leading) {
                    ForEach(messagesViewModel.messages, id: \.id) {item in
                        MessageSelf(message: item)
                    }
                }
            
        }.padding()
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environment(\.colorScheme, .dark)
    }
}
