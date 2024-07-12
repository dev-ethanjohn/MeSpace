//
//  LogInView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/11/24.
//



import SwiftUI

struct LoginView: View {
    
    @State private var showRegistration = false

    @State var email: String
    @State var password: String
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Spacer()
                LoginHeaderView()
                Spacer()
                VStack {
                    loginForm
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        .shadow(color: Color.black.opacity(0.08), radius: 2, x: 0, y: 3)
                    
                    Spacer()
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.72)
            }
        }
        .padding(.horizontal, 12)
        .background(Color(.systemGray) .opacity(0.2))
        
    }
    
    @ViewBuilder
    private var loginForm: some View {
        VStack {
            VStack {
                SignInInputView(email: $email, password: $password)
                NavigationAndActionsView()
            }
            .padding(.horizontal)
            .padding()
            
            Spacer()
            
            VStack {
                Divider()
                Spacer()
                RegistrationLinkView(showRegistration: $showRegistration)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 36)
            .padding(.vertical)
        }
    }
}

#Preview {
    NavigationStack {
        LoginView(email: "mespace@gmail.com", password: "123456")
    }
}

