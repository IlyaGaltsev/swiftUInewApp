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
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    
    
    static let color0 = Color(red: 238/255, green: 130/255, blue: 238/255);
    static let color1 = Color(red: 0/255, green: 209/255, blue: 255/255);
    
    let gradient = Gradient(colors: [color0, color1]);
    
    var body: some View{
        ZStack {
            GradientBackgoundView()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Sign In")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(.top)
                    .foregroundColor(Color.primary.opacity(0.4))
                
                Text("Login an your account")
                    .font(.callout)
                    .frame(maxWidth : .infinity, alignment: .leading)
                
                //                Divider().padding()
                
                VStack (spacing: 12) {
                    
                    HStack {
                        
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(maxWidth: 40, maxHeight: 40)
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(Color.black)
                                    .padding()
                            }
                            
                            TextField("Enter email", text: $email)
                        
                    }
                  
                    
                    
                    SecureField("Enter password", text: $password)
//                        .modifier(TextFiled())
                    
                    
                }
                .padding()
                Text("By signing up you accept the **Terms of Service** and **Privacy Policy**")
                    .font(.footnote)
                
                Button {
                    if (isSignUp) {
                        register()
                    }else {
                        login()
                    }
                } label: {
                    ZStack {
                        if (!isSignUp){
                            Text("Sign in")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color.blue.opacity(0.4))
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.white.opacity(0.6), lineWidth: 2)
                                )
                        } else {
                            Text("Create account")
                                .bold()
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(.thickMaterial)
                                .cornerRadius(14)
                                
                        }
                    }
                }
                Button {
                    withAnimation() {
                        isSignUp.toggle()
                    }
                   
                } label: {
                    if (!isSignUp) {
                        Text("Don't have an account? Create account")
                            .font(.footnote)
                            .padding(.top, 8)
                    }else {
                        Text("Do have an account? Sign in")
                            .font(.footnote)
                            .padding(.top, 8)
                    }
                   
                }
                
            }
            .padding()
            .background(.gray.opacity(0.2))
            .foregroundColor(Color.primary.opacity(0.35))
            .cornerRadius(35)
            .padding()
        }
    }
    
    func login() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
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
         
//            .background(Color.clear)
//            .stroke(.white.opacity(0.6), lineWidth: 2)
        
//            .clipShape(RoundedRectangle(cornerRadius: 10)  )
      
    }
}
