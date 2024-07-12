//
//  SignInInputView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/12/24.
//

import SwiftUI

struct SignInInputView: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            Image("mespace_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .padding(32)
            
            VStack{
                TextField("Enter email", text: $email)
                    .autocapitalization(.none)
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                
                SecureField("Enter password", text: $password)
                    .autocapitalization(.none)
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .background(.white)
        }
    }
}

#Preview {
    SignInInputView(email: .constant("user@example.com"), password: .constant("password123"))
        .previewLayout(.sizeThatFits)
}
