//
//  NavAndActionsView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/12/24.
//

import SwiftUI

import SwiftUI

struct NavigationAndActionsView: View {
    
    var loginMethods: [String] = ["google", "apple", "facebook"]
    
    var body: some View {
        NavigationStack {
            VStack {

                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Forgot password")
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.vertical, 12)
                            .foregroundStyle(.black)
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.width * 1)
                
                Button(action: {
                   
                }, label: {
                    Text("Join MySpace Now!")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .padding(.vertical, 4)
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 8))
                })
            }
            
            Text("or")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .padding()
            
            HStack(spacing: 0) {
                ForEach(loginMethods, id: \.self) { index in
                    
                    Button {
                        
                    } label: {
                        Image("\(index)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal, 12)
                        
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 32)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.7)
        }
    }
}

struct NavigationAndActionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationAndActionsView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(.systemGray5))
    }
}



