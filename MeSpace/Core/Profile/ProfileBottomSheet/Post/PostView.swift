//
//  PostView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/13/24.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(spacing: 0) {
            PostContentView()
            SingleMediaPost(imageName: "happy_birthday")
            PostEngagementView()
        }
        .padding(.bottom, 8)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

