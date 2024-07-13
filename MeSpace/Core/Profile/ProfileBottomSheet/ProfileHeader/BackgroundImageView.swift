import SwiftUI

struct BackgroundImageView: View {
    let progress: CGFloat
    let imageHeight: CGFloat
    
    var body: some View {
        GeometryReader { imageGeometry in
            Image("profileheaderpic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageGeometry.size.width * 1.06)
                .blur(radius: 4)
                .overlay(Color.black.opacity(0.6))
                .mask(Rectangle().frame(width: imageGeometry.size.width, height: imageHeight))
                .frame(width: imageGeometry.size.width, height: imageHeight)
                .clipped()
                .offset(y: progress > 0.99 ? -imageHeight : 0)
        }
        .frame(height: imageHeight)
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView(progress: 0.5, imageHeight: 140)
    }
}
