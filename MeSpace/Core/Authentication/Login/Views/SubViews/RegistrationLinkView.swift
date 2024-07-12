//
//  RegistrationLinkView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/12/24.
//


import SwiftUI

struct RegistrationLinkView: View {
    @Binding var showRegistration: Bool
    
    var body: some View {

        
        Button(action: {
            showRegistration = true
        }) {
            HStack(spacing: 3) {
                Text("Don't have an account?")
                Text("Sign Up")
                    .fontWeight(.bold)
            }
            .foregroundStyle(.black)
            .font(.footnote)

        }
    }
}

#Preview {
    RegistrationLinkView(showRegistration: .constant(false))
}
