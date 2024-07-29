//
//  PostCommentsView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/29/24.
//

import SwiftUI

struct PostCommentsView: View {
    var body: some View {
        
        VStack(alignment: .leading) {

                Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)

            
            Divider()
            
            VStack {
                
                HStack(alignment: .top, spacing: 12) {
                    Image("max_verstappen")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                    .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading, spacing: 0) {
                          
                            HStack(spacing: 0) {
                                Text("Max Verstappen")
                                        .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("・")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                                Text("1h")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                            Text("@maxverstappen")
                                .font(.footnote)
                                .foregroundStyle(Color(.darkGray))
                        }
                        //Comment Contents
                        Text("I do feel your interpretation about the moon landing is highly confusing and i may associate as being ignorant js ks  h k h j k  o ")
                            .font(.subheadline)
                            .lineSpacing(-1)
                    }
                    
                    Image(systemName: "heart")
                }
            }
            .padding(.vertical, 8)
        }
        .padding()
        .padding(.bottom, 120)
    }
}

#Preview {
    PostCommentsView()
}
