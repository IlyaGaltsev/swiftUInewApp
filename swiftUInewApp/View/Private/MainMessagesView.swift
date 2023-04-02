import SwiftUI
import AudioToolbox
import Firebase
import FirebaseFirestore
import SDWebImageSwiftUI

struct MainMessagesView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State var sholdShowLogOutOptions = false
    
    private var navBar: some View {
        HStack(spacing: 16) {
            
            WebImage(url: viewModel.auth.currentUser?.photoURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48)
                .mask(RoundedRectangle(cornerRadius: 48).frame(width: 48, height: 48))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.auth.currentUser?.displayName ?? "This is you")
                    .font(.system(size: 24, weight: .bold))
                
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 8, height: 8)
                    
                    Text("online")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.lightGray))
                }
            }
            Spacer()
            Button {
                AudioServicesPlaySystemSound(1519)
                self.sholdShowLogOutOptions.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
            }.actionSheet(isPresented: $sholdShowLogOutOptions) {
                .init(title: Text("Settings"),
                      message: Text("What do you want to do?"), buttons: [
                        .destructive(Text("Log Out"), action: {
                            viewModel.signOut()
                        }), .cancel()])
            }
            
        }.padding()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                navBar
               
                ScrollView {
                    ForEach(0..<20, id: \.self) { num in
                        VStack {
                            HStack(spacing: 10) {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 32))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 44)
                                            .stroke(Color.black, lineWidth: 1))

                                VStack(alignment: .leading) {
                                    Text("UserName")
                                        .font(.system(size: 16, weight: .bold))

                                    Text("Message sent to user")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color(.lightGray))
                                }
                                Spacer()

                                Text("22d")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            Divider()
                        }.padding(.horizontal)
                    }
                }
                
            }.overlay(
                Button {

                } label: {
                    HStack {
                        Spacer()
                        Text("+ New Message")
                            .font(.system(size: 16, weight: .bold)
                            )
                        Spacer()
                    }.foregroundColor(.white)
                        .padding(.vertical)
                        .background(Color.blue)
                        .cornerRadius(32)
                        .padding(.horizontal)
                        .padding(.bottom,8)
                }, alignment: .bottom)
            .navigationBarHidden(true)
            //        .navigationTitle("Main Messages View")
            
        }
    }
}
struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
            .environment(\.colorScheme, .dark)
    }
}
