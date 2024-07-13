
import SwiftUI

struct PostContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            PostProfileView()
            PostCaptionView()
        }
        .padding(16)
        .overlay {
            UnevenRoundedRectangle(topLeadingRadius: 24, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 24, style: .continuous)
                .stroke(Color(.systemGray5), lineWidth: 2)
        }
    }
}

struct PostContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostContentView()
    }
}
