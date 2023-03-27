import SwiftUI
import Firebase

import SwiftUI

struct GradientBackgoundView: View {
    @State var start = UnitPoint(x:0, y: -2)
    @State var end = UnitPoint(x:4, y: 0)
    static let color0 = Color(red: 238/255, green: 130/255, blue: 238/255);
    static let color1 = Color(red: 0/255, green: 209/255, blue: 255/255);
    static let color2 = Color(red: 238/255, green: 130/255, blue: 238/255);
    static let color3 = Color(red: 0/255, green: 209/255, blue: 255/255);
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [color0, color1, color2, color3]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint:start , endPoint: end)
            .animation(Animation.easeInOut(duration: 6)
                .repeatForever()).onReceive(timer, perform: { _ in
                    self.start = UnitPoint(x: 4, y: 0)
                    self.end = UnitPoint(x: 0, y: 2)
                    self.start = UnitPoint(x: -50, y: 20)
                    self.start = UnitPoint(x: 4, y: 0)
                })
    }
}


struct SignInView: View {
    @State private var isError = false
    @State private var errorText = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    
    
    static let color0 = Color(red: 0.984, green: 0.286, blue: 0.773);
    static let color1 = Color(red: 0.984, green: 0.553, blue: 0.671);
    
    
    static let color2 = Color(red: 238/255, green: 130/255, blue: 238/255);
    static let color3 = Color(red: 0/255, green: 209/255, blue: 255/255);
    
    let gradient = Gradient(colors: [color0, color1]);
    
    var body: some View{
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color(red: 0.184, green: 0.184, blue: 0.333))
                .edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .center){
                Text(!isSignUp ? "Sign In" : "Create account")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(.top)
                    .foregroundColor(Color.white.opacity(0.7))
                
                Text(!isSignUp ? "Login an your account" : "Create an your account")
                    .font(.callout)
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(maxWidth : .infinity, maxHeight: .leastNonzeroMagnitude)
                    
                    VStack (alignment: .leading, spacing: 20) {
                        
                        HStack() {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(maxWidth: 40, maxHeight: 40)
                                    .foregroundColor(Color(red: 0.416, green: 0.22, blue: 0.337))
                                Image(systemName: "at")
                                    .foregroundColor(Color.white)
                                    .padding()
                            }
                            
                            TextField("Enter email", text: $email)
                                .foregroundColor(Color.white)
                            
                        }
                        
                    }.background(.gray.opacity(0.2))
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.white.opacity(0.4), lineWidth: 2)
                        )
                    
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .frame(maxWidth : .infinity, maxHeight: .leastNonzeroMagnitude)
                    
                    VStack (alignment: .leading, spacing: 20) {
                        
                        HStack() {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(maxWidth: 40, maxHeight: 40)
                                    .foregroundColor(Color(red: 0.416, green: 0.22, blue: 0.337))
                                Image(systemName: "lock.fill")
                                    .foregroundColor(Color.white)
                                    .padding()
                            }
                            
                            SecureField("Enter password", text: $password)
                                .foregroundColor(Color.white)
                            
                        }
                        
                    }.background(.gray.opacity(0.2))
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.white.opacity(0.4), lineWidth: 2)
                        )
                    
                }
                
                
                
                Text("By signing up you accept the **Terms of Service** and **Privacy Policy**")
                    .font(.footnote)
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 12, trailing: 0))
                
                Button {
                    isError = false
                    
                    if (!isSignUp) {
                        login()
                    }else {
                        register()
                    }
                    
                } label: {
                    ZStack {
                        
                        Text(!isSignUp ? "Sign In" : "Create account")
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(LinearGradient(gradient: gradient, startPoint:.topLeading , endPoint: .bottomTrailing))
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.white.opacity(0.6), lineWidth: 2)
                            )
                        
                        
                        
                    }
                }
                Button {
                    withAnimation() {
                        isSignUp.toggle()
                    }
                    
                } label: {
                    
                    Text(!isSignUp ? "Don't have an account? Create account": "Do have an account? Sign in")
                        .font(.footnote)
                        .padding(.top, 8)
                    
                }
                if (isError == true) {
                    Text(errorText)
                        .foregroundColor(Color.red)
                        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
                }
           
                
            }
            .foregroundColor(Color.white.opacity(0.6))
            .cornerRadius(35)
            .padding()
        }
    }
    
    func login() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
                errorText = error!.localizedDescription
                isError = true
            }
        }
    }
    
    func register() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
                errorText = error!.localizedDescription
                isError = true
            }
        }
        print(FirebaseManager.shared.auth.currentUser !== nil)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct TextFiled: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
            .foregroundStyle(Color.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.teal    )
            .border(Color.red)
    }
}
