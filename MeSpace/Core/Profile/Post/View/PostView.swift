//
//  PostView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/27/24.
//

import SwiftUI

struct PostView: View {
    @State var post: Post
    let width: CGFloat
    @State private var animateHeart = false
    
    @Namespace var animation
    
    init(post: Post, width: CGFloat) {
          self._post = State(initialValue: post)
          self.width = width
      }
    
    var body: some View {
        
        //        NavigationLink(destination: OwnPostDetailedView(post: post)) {
        VStack(alignment: .leading, spacing: 2) {
            Image(post.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
                .clipped()
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.24), radius: 1, x: 0, y: 2)
                .matchedGeometryEffect(id: "image\(post.id)", in: animation)
            
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 4) {
                    Text(post.author)
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                    
                    Text(post.headline)
                        .font(.caption2)
                        .bold()
                        .lineLimit(1)
                    //                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer(minLength: 2)
                    
                    Button(action: {
                        post.isLked.toggle()
                        post.likes += post.isLked ? 1 : -1
                        withAnimation(.easeIn(duration: 0.16)) {
                            animateHeart.toggle()
                        }
                        withAnimation(.easeOut(duration: 0.16).delay(0.16)) {
                            animateHeart.toggle()
                        }
                    }) {
                        Image(systemName: post.isLked ? "heart.fill" : "heart")
                            .foregroundColor(post.isLked  ? .red : Color(.systemGray3))
                            .font(.callout)
                            .scaleEffect(animateHeart ? 1.3 : 1.0)
                    }
                }
                
                HStack(spacing: 2) {
                    Image(systemName: "eye")
                        .foregroundColor(.gray)
                    Text("\(post.views)")
                        .foregroundColor(.gray)
                }
                .font(.system(size: 11))
            }
            .padding(6)
        }
        .frame(width: width)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.1), lineWidth: 0.5)
        }
        .background(Color(.systemGray6).opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    //
    //    }
}

//struct PostView_Previews: PreviewProvider {
//    @State static var previewPost = Post.samplePosts()[0]
//    
//    static var previews: some View {
//        PostView(post: $previewPost, width: 100)
//    }
//}
