//
//  CommentInputView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/30/24.
//

import SwiftUI

struct CommentInputView: View {
    @Binding var commentText: String
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add comment", text: $commentText)
                    .font(.subheadline)
                    .padding(.horizontal, 16)
                    .frame(minHeight: 36)
                    .background(Color(.systemGray5).opacity(0.7))
                    .clipShape(.capsule)
                
                Button(action: {
                    // Like action
                }) {
                    Image(systemName: "heart")
                        .font(.title2)
                        .padding(.leading, 10)
                }
                
                Button(action: {
                    // Share action
                }) {
                    Image(systemName: "paperplane")
                        .font(.title2)
                        .padding(.leading, 10)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 8)
        }
        .tint(.black)
        .frame(maxHeight: UIScreen.main.bounds.height * 0.06)
        .padding(.bottom, 0)
        .padding(.horizontal)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.08), radius: 3, x: 0, y: -1)
    }
}

#Preview {
    CommentInputView(commentText: .constant(""))
}
