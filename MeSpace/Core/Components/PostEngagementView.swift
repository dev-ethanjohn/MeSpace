//
//  PostEngagementView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/7/24.
//

import SwiftUI

struct PostEngagementView: View {
    var body: some View {
        HStack(spacing: 24) {
            EngagementButton(imageName: "heart.fill", count: "18", color: .red)
            EngagementButton(imageName: "message", count: "7")
            EngagementButton(imageName: "paperplane", count: "1")
            Spacer()
            Image(systemName: "shippingbox")
        }
        .font(.subheadline)
        .foregroundStyle(Color(.darkGray))
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        //        .background(
        //            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 24, bottomTrailingRadius: 24, topTrailingRadius: 0, style: .continuous)
        //                .fill(Color.white)
        //        )
    }
}


struct EngagementButton: View {
    let imageName: String
    let count: String
    var color: Color = Color(.darkGray)
    
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: imageName)
                .foregroundColor(color)
            Text(count)
        }
    }
}

#Preview {
    PostEngagementView()
}

