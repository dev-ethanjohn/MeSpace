//
//  LinksContainerView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/21/24.
//

import SwiftUI

struct LinksContainerView: View {
    
    let icons = ["google", "apple", "facebook"]
    
    var body: some View {
        
      
        
        
        
        VStack(alignment: .leading, spacing: 2) {
            Text("Links (test)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.black)
            HStack(spacing: 8) {
                ForEach(icons, id: \.self) { icon in
                    Image(icon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                }
                
                Spacer()
            }
        }
        .padding(12)
        .frame(maxWidth: UIScreen.main.bounds.size.width)
//        .frame(minHeight: 50)
        .background(Color(.white))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: Color.black.opacity(0.16), radius: 2, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1.5)
        )
    }
}

#Preview {
    LinksContainerView()
}
