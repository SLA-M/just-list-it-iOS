//
//  LoginView.swift
//  Just List It
//
//  Created by Fomagran on 2023/03/01.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            Color("background").ignoresSafeArea()
            VStack {
                Text("Login")
                    .font(.system(size:30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Enter your email address")
                            .font(.system(size:14))
                            .foregroundColor(.white.opacity(0.5))
                            .padding(.leading,10)
                    }
                    
                    TextField("",text: $email)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .foregroundColor(.white)
                }
                .padding(.horizontal,10)
                .padding(.vertical,5)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Enter your password")
                            .font(.system(size:14))
                            .foregroundColor(.white.opacity(0.5))
                            .padding(.leading,10)
                    }
                    
                    SecureField("",text: $password)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                }
                .padding(.horizontal,10)
                .padding(.vertical,5)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
