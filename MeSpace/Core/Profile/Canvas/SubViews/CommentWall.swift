//
//  CommentWall.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/17/24.
//
import SwiftUI

struct CommentWall: View {
    let maxOffset: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            handleBar
            
            Text("Comment Wall")
        }
        .padding()
        .frame(maxHeight: UIScreen.main.bounds.size.height * 0.9, alignment: .top)
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
    
    private var handleBar: some View {
        Capsule()
            .fill(Color.secondary)
            .frame(width: 16, height: 3)
            .padding(.top, 4)
            .padding(.bottom, 4)
    }
}
