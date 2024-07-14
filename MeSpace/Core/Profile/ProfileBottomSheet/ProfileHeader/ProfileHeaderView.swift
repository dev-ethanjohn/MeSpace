

import SwiftUI

struct ProfileHeaderView: View {
    let progress: CGFloat
    let imageHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .top) {
            BackgroundImageView(progress: progress, imageHeight: imageHeight)
            Capsule()
                .fill(Color.white.opacity(0.4))
                .frame(width: 32, height: 4)
                .padding(.top, 8)
            MainProfileHeaderInfoView()
        }
        .frame(height: imageHeight)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(progress: 0.5, imageHeight: 140)
    }
}

