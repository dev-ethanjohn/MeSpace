import SwiftUI

struct ContentSheet: View {
    @State private var selectedFilter: TabBarContentFilter = .posts
    @Namespace var animation
    let progress: CGFloat
    let maxOffset: CGFloat
    
    
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                ZStack {
                    GeometryReader { imageGeometry in
                        ZStack {
                              Image("ghibli4")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: imageGeometry.size.width * 1.06, height: 140)
                            
                              LinearGradient(
                                  gradient: Gradient(stops: [
                                    .init(color: Color(hex: 0x111111).opacity(0.1), location: 0),
                                    .init(color: Color(hex: 0x111111).opacity(0.2), location: 0.4),
                                    .init(color: Color(hex: 0x222222).opacity(0.45), location: 0.55),
                                    .init(color: Color(hex: 0x444444).opacity(0.75), location: 0.70),
                                    .init(color: Color(hex: 0x444444).opacity(0.95), location: 0.85),
                                    .init(color: Color(hex: 0x444444).opacity(1), location: 1)
                                  ]),
                                  startPoint: .top,
                                  endPoint: .bottom
                              )
                            
                            Color.black.opacity(0.20)
                          }
                          .frame(width: imageGeometry.size.width, height: 140)
                          .clipShape(Rectangle())
                    }
                    
                    ContentProfileWrapper()
                }
                .frame(height: 140)
                .offset(y: progress >= 0.99 ? -140 : 0) // if progress >= 0.99 then it is -140 y offset. but it is affecting the spacecanvasview, in this one with a -140 offset value is tranfered to the bottom of the spacecanvasview. but i do love that
//                .opacity(progress >= 0.99 ? 0 : 1)
                
                ContentFilterTabBarWrapper(selectedFilter: $selectedFilter, animation: animation, progress: progress)
                    .offset(y: progress >= 0.99 ? -140 : 0)
                
              
                
                
            }
            
            
            Capsule()
                .fill(progress >= 0.99 ? Color.black.opacity(0.4) : Color.white.opacity(0.4))
                .frame(width: 32, height: 4)
                .padding(.top, 8)
                .zIndex(1)
        }
        .frame(maxHeight: UIScreen.main.bounds.size.height * 0.9, alignment: .top)
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(32)
    }
}

struct TestBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ContentSheet(progress: 0.5, maxOffset: 300)
    }
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
