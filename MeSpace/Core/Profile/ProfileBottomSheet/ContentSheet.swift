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
                              Image("crowd")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
                                  .frame(width: imageGeometry.size.width * 1.06, height: 140)
                                  .blur(radius: 0.5)
                              
                              LinearGradient(
                                  gradient: Gradient(stops: [
                                    .init(color: Color(.black).opacity(0.20), location: 0),
                                      .init(color: Color(.black).opacity(0.30), location: 0.4),
                                    .init(color: Color(.black).opacity(0.40), location: 0.55),
                                      .init(color: Color(.black).opacity(0.70), location: 1)
                                  ]),
                                  startPoint: .top,
                                  endPoint: .bottom
                              )
                          }
                          .frame(width: imageGeometry.size.width, height: 140)
                          .clipShape(Rectangle())
                    }
                    
                    ContentProfileWrapper()
                }
                .frame(height: 140)
                .offset(y: progress >= 0.99 ? -140 : 0)
                
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
