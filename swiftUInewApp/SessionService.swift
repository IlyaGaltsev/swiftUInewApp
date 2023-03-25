////
////  SessionService.swift
////  swiftUInewApp
////
////  Created by Илья on 25.03.2023.
////
//
//import Combine
//import Foundation
//import FirebaseAuth
//
//enum SessionState {
//    case loggedIn
//    case loggedOut
//}
//
//protocol SessionService {
//    var state: SessionService {get}
//    var userDetails: SessionUserDetails? {get}
//    func logout()
//}
//
//final class SessionServiceImpl: ObservableObject, SessionService {
//
//    @Published var state: SessionService = .loggedOut
//    @Published var userDetails: SessionUserDetails?
//
//    private var handler: AuthStateDidChangeListenerHandle?
//
//    init() {
//        setupFirebaseAuthHandler()
//    }
//
//    func logout() {
//
//    }
//}
//
//private extension SessionServiceImpl {
//
//    func setupFirebaseAuthHandler() {
//
//        handler = Auth.auth().addStateDidChangeListener {[weak self ] res, user in
//            guard let self = self else { return }
//            self.state = user == nil ? .loggedIn : .loggedOut
//            if let uid = user?.uid {
//                self.handlerRefresh(with: uid)
//            }
//        }
//    }
//
//    func handlerRefresh(with uid: String) {
//
//        Database
//            .database()
//            .reference()
//            .child("users")
//            .child(uid)
//            .observe(.value) {
//                [weak self] snapsot in
//
//                guard let self = self,
//                      let value = snapsot.value as? NSDictionary,
//                      let firstName = value[RegistrationKeys.firstName.rawValue] as? String,
//                      let firstName = value[RegistrationKeys.firstName.rawValue] as? String,
//            }
//    }
//}
