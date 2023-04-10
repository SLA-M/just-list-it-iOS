//
//  FirebaseAuthService.swift
//  Just List It
//
//  Created by Fomagran on 2023/03/21.
//

import Foundation
import FirebaseAuth

struct FirebaseAuthService: AuthProtocol {
    private let auth = Auth.auth()
    
    func signIn() {
        
    }
    
    func signOut() {
        
    }
    
    func createUser(_ email: String, _ password: String) {
        
        auth.createUser(withEmail: email, password: password) { (user,error) in

            if error != nil {
                print("Already Exists",error)
            } else {
                print("New User")
            }
        }
    }
    
    
}
