//
//  LoginViewModel.swift
//  Just List It
//
//  Created by Fomagran on 2023/03/02.
//

import Firebase
import GoogleSignIn
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    func checkExsists(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user,error) in

            if let error = error as NSError? {
                let errorUserInfo = AuthErrorCode(_nsError: error).userInfo
                if let errorTitle = errorUserInfo["FIRAuthErrorUserInfoNameKey"], let errorDescription = errorUserInfo["NSLocalizedDescription"]{
                    print("Title: ",errorTitle,"Description: ",errorDescription)
                }
            }
        }
    }
        
        func emailSignIn(email: String, password: String) {
            checkExsists(email: email, password: password)
//            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//                guard let _ = self else { return }
//                print(authResult)
//            }
        }
        
        func googleSignIn() {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
            if GIDSignIn.sharedInstance.hasPreviousSignIn() {
                GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                    authenticateUser(for: user, with: error)
                }
            } else {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
                
                GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [unowned self] result, error in
                    authenticateUser(for: result?.user, with: error)
                }
            }
        }
        
        private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let idToken = user?.idToken?.tokenString else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user?.accessToken.tokenString ?? "")
            
            Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.state = .signedIn
                }
            }
        }
        
        func signOut() {
            GIDSignIn.sharedInstance.signOut()
            do {
                try Auth.auth().signOut()
                state = .signedOut
            } catch {
                print(error.localizedDescription)
            }
        }
    }
