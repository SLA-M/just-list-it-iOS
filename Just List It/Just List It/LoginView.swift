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
            
            //Set Background
            Color.Background.ignoresSafeArea()
            
            //Just List It Text
            VStack {
                Text("Just List It")
                    .font(.system(size:40))
                    .fontWeight(.bold)
                    .foregroundColor(.Text)
                
                //Email, Password TextField
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Enter your email address...")
                            .font(.system(size:12))
                            .foregroundColor(.gray.opacity(0.5))
                            .padding(.leading,10)
                    }
                    
                    TextField("",text: $email)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .foregroundColor(.Text)
                }
                .padding(.horizontal,50)
                .padding(.vertical,5)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Enter your password...")
                            .font(.system(size:12))
                            .foregroundColor(.gray.opacity(0.5))
                            .padding(.leading,10)
                    }
                    
                    SecureField("",text: $password)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .font(.system(size: 13))
                }
                .padding(.horizontal,50)
                .padding(.vertical,5)
                
                //Login Button
                Button {
                    
                } label: {
                    Text("Login")
                        .padding(.horizontal,40)
                        .padding(.vertical,10)
                        .font(.system(size:20))
                        .bold()
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(10)
                }
                .padding(10)
                
                
                //Google, Apple Login Button
                HStack(spacing:40) {
                    Button {
                        
                    } label: {
                        Image.Google
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(25)
                            
                    }
                    
                    Button {
                        
                    } label: {
                        Image.Apple
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(25)
                            
                    }
                }
                

            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
