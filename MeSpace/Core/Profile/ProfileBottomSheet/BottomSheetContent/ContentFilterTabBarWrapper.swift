import SwiftUI

struct ContentFilterTabBarWrapper: View {
    @Binding var selectedFilter: TabBarContentFilter
    var animation: Namespace.ID
    let progress: CGFloat
    @Binding var scrollToTop: Bool
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabBarContentFilter.allCases, id: \.self) { filter in
                ContentFilterTabBarView(filter: filter, selectedFilter: $selectedFilter, animation: animation, scrollToTop: $scrollToTop)
            }
        }
        .padding(.top, progress >= 0.99 ? 10 : 0)
        .frame(height: progress >= 0.99 ? 52 : 44)
        //        .progressBackground(progress: progress)
        .background(Color.white)
    }
}




struct ContentFilterTabBarView: View {
    let filter: TabBarContentFilter
    @Binding var selectedFilter: TabBarContentFilter
    var animation: Namespace.ID
    @Binding var scrollToTop: Bool
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text(filter.title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(selectedFilter == filter ? .black : .gray)
                .padding(.vertical, 8)
                .matchedGeometryEffect(id: "text_\(filter)", in: animation)
                .scaleEffect(isAnimating ? 1.05 : 1.0)
                .opacity(isAnimating ? 0.7 : 1.0)
            
            ZStack {
                if selectedFilter == filter {
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: 160, height: 1)
                        .matchedGeometryEffect(id: "underline", in: animation)
                } else {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(width: 160, height: 1)
                }
            }
            .frame(height: 1)
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedFilter = filter
                scrollToTop = true
                isAnimating = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring(duration: 0.1)) {
                    isAnimating = false
                }
            }
        }
    }
}


struct ContentFilterTabBarWrapper_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        ContentFilterTabBarWrapper(selectedFilter: .constant(.posts), animation: animation, progress: 0.5, scrollToTop: .constant(true))
    }
}


//struct ProgressBackgroundModifier: ViewModifier {
//    let progress: Double
//
//    func body(content: Content) -> some View {
//        content
//            .background(
//                progress >= 0.99
//                    ? AnyShapeStyle(Material.thin)
//                    : AnyShapeStyle(Color.white)
//            )
//    }
//}
//
//extension View {
//    func progressBackground(progress: Double) -> some View {
//        self.modifier(ProgressBackgroundModifier(progress: progress))
//    }
//}
