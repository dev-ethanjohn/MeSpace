//
//  SingleMediaPost.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/13/24.
//

import SwiftUI

struct SingleMediaPost: View {
    let imageName: String
    
    var body: some View {
        if let uiImage = UIImage(named: imageName) {
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                let aspectRatio = uiImage.size.height / uiImage.size.width
                let imageHeight = min(screenWidth * aspectRatio, 550) // Ensure the height doesn't exceed 550
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth, height: imageHeight)
                    .clipped()
            }
            .frame(height: min(UIImage(named: imageName)!.size.height / UIImage(named: imageName)!.size.width * UIScreen.main.bounds.width, 550)) // Maintain aspect ratio with max height 550
        } else {
            // Placeholder
            Color.gray
                .frame(height: 200)
        }
    }
}

struct SingleMediaPost_Previews: PreviewProvider {
    static var previews: some View {
        SingleMediaPost(imageName: "happy_birthday")
            .previewLayout(.sizeThatFits)
    }
}
