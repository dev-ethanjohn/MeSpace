//import SwiftUI
//
//import SwiftUI
//
//struct ContentSheet: View {
//    @State private var selectedFilter: TabBarContentFilter = .posts
//    @Namespace var animation
//    let progress: CGFloat
//    let maxOffset: CGFloat
//    
//    @State private var posts: [Post] = Post.samplePosts()
//    
//    let columns = 2
//    let spacing: CGFloat = 14
//    
//    @State private var scrollOffset: CGFloat = 0.0
//
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .top) {
//                VStack(spacing: 0) {
//                    // Header content
//                    headerContent
//                    
//                    ContentFilterTabBarWrapper(selectedFilter: $selectedFilter, animation: animation, progress: progress)
//                        .offset(y: progress >= 0.99 ? -140 : 0)
//                    
//                    ScrollView(progress >= 0.99 ? .vertical : [], showsIndicators: false) {
//
//                        VStack {
//                            WaterfallGrid(items: $posts, columns: columns, spacing: spacing) { $post in
//                                PostView(post: $post, width: (geometry.size.width - spacing * CGFloat(columns + 1)) / CGFloat(columns))
//                            }
//                            .padding(10)
//                            .background(Color(.white))
//                            
//                            
//                            Text("End")
//                                .font(.footnote)
//                                .foregroundColor(.secondary)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .padding(.vertical, 20)
//                                .padding(.bottom, 120)
//                        }
//                    }
////                    .gesture(DragGesture()
////                                        .onChanged { value in
////                                            scrollOffset = value.translation.height
////                                        }
////                                        .onEnded { value in
////                                            withAnimation {
////                                                scrollOffset = 0
////                                            }
////                                        }
////                                    )
//                    .offset(y: progress >= 0.99 ? -140 : 0)
//                    
//                }
//                .frame(height: geometry.size.height + (progress >= 0.99 ? 140 : 0))
//                
//                Capsule()
//                    .fill(progress >= 0.99 ? Color.black.opacity(0.4) : Color.white.opacity(0.4))
//                    .frame(width: 32, height: 4)
//                    .padding(.top, 8)
//                    .zIndex(1)
//            }
//        }
//        .frame(maxWidth: .infinity)
//        .background(Color(.white))
//        .cornerRadius(32)
//    }
//    
//    private var headerContent: some View {
//        ZStack {
//            GeometryReader { imageGeometry in
//                ZStack {
//                    Image("ghibli4")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: imageGeometry.size.width * 1.06, height: 140)
//                    
//                    LinearGradient(
//                        gradient: Gradient(stops: [
//                            .init(color: Color(hex: 0x111111).opacity(0.1), location: 0),
//                            .init(color: Color(hex: 0x111111).opacity(0.2), location: 0.4),
//                            .init(color: Color(hex: 0x222222).opacity(0.45), location: 0.55),
//                            .init(color: Color(hex: 0x444444).opacity(0.75), location: 0.70),
//                            .init(color: Color(hex: 0x444444).opacity(0.95), location: 0.85),
//                            .init(color: Color(hex: 0x444444).opacity(1), location: 1)
//                        ]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                    
//                    Color.black.opacity(0.20)
//                }
//                .frame(width: imageGeometry.size.width, height: 140)
//                .clipShape(Rectangle())
//            }
//            
//            ContentProfileWrapper()
//        }
//        .frame(height: 140)
//        .offset(y: progress >= 0.99 ? -140 : 0)
//    }
//}
//
//
//struct TestBottomSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentSheet(progress: 0.5, maxOffset: 300)
//    }
//}
//
//
//
//
//struct WaterfallGrid<Item: Identifiable, Content: View>: View {
//    let items: Binding<[Item]>
//    let columns: Int
//    let spacing: CGFloat
//    let content: (Binding<Item>) -> Content
//    
//    var body: some View {
//        HStack(alignment: .top, spacing: spacing) {
//            ForEach(0..<columns, id: \.self) { column in
//                LazyVStack(spacing: spacing) {
//                    ForEach(Array(items.wrappedValue.enumerated().filter { $0.offset % columns == column }), id: \.element.id) { index, _ in
//                        content(items[index])
//                    }
//                }
//            }
//        }
//    }
//}

import SwiftUI

struct ContentSheet: View {
    @State private var selectedFilter: TabBarContentFilter = .posts
    @Namespace var animation
    let progress: CGFloat
    let maxOffset: CGFloat
    
    @State private var posts: [Post] = Post.samplePosts()
    @State private var scrollViewOffset: CGFloat = 0
    @State private var startOffset: CGFloat = 0
    @State private var isScrolling: Bool = false
    
    let columns = 2
    let spacing: CGFloat = 14
    
    var body: some View {
         GeometryReader { geometry in
             ZStack(alignment: .top) {
                 VStack(spacing: 0) {
                     // Header content
                     headerContent
                     
                     ContentFilterTabBarWrapper(selectedFilter: $selectedFilter, animation: animation, progress: progress)
                         .offset(y: progress >= 0.99 ? -140 : 0)
                     
                     CustomScrollView(
                         isFullyExpanded: progress >= 0.99,
                         scrollOffset: $scrollViewOffset,
                         startOffset: $startOffset,
                         isScrolling: $isScrolling,
                         progress: progress
                     ) {
                         VStack {
                             WaterfallGrid(items: $posts, columns: columns, spacing: spacing) { $post in
                                 PostView(post: $post, width: (geometry.size.width - spacing * CGFloat(columns + 1)) / CGFloat(columns))
                             }
                             .padding(10)
                             .background(Color(.white))
                             
                             Text("End")
                                 .font(.footnote)
                                 .foregroundColor(.secondary)
                                 .frame(maxWidth: .infinity, alignment: .center)
                                 .padding(.vertical, 20)
                                 .padding(.bottom, 120)
                         }
                     }
                     .offset(y: progress >= 0.99 ? -140 : 0)
                 }
                 .frame(height: geometry.size.height + (progress >= 0.99 ? 140 : 0))
                 
                 Capsule()
                     .fill(progress >= 0.99 ? Color.black.opacity(0.4) : Color.white.opacity(0.4))
                     .frame(width: 32, height: 4)
                     .padding(.top, 8)
                     .zIndex(1)
             }
         }
         .frame(maxWidth: .infinity)
         .background(Color(.white))
         .cornerRadius(32)
         .onChange(of: progress) { _, newProgress in
             if newProgress < 0.99 {
                 scrollViewOffset = max(0, scrollViewOffset) // Allow keeping upward scroll, reset only if scrolled down
                 startOffset = 0 // Reset start offset
                 isScrolling = false // Disable scrolling when progress is less than 0.99
             }
         }
     }
    
    private var headerContent: some View {
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
        .offset(y: progress >= 0.99 ? -140 : 0)
    }
}

struct CustomScrollView<Content: View>: View {
    var isFullyExpanded: Bool
    @Binding var scrollOffset: CGFloat
    @Binding var startOffset: CGFloat
    @Binding var isScrolling: Bool
    let progress: CGFloat
    let content: () -> Content

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { geometry in
                Color.clear
                    .preference(key: ScrollOffsetKey.self, value: geometry.frame(in: .global).minY)
            }
            .frame(height: 0)
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                if startOffset == 0 {
                    startOffset = value
                }
                scrollOffset = startOffset - value
                isScrolling = scrollOffset > 0
            }

            content()
        }
        .gesture(DragGesture()
            .onChanged { value in
                if !isFullyExpanded && value.translation.height > 0 && scrollOffset <= 0 {
                    // Prevent scrolling down when not fully expanded and already at the top
                    scrollOffset = 0
                    startOffset = 0
                }
            }
        )
        .disabled(!isFullyExpanded && scrollOffset <= 0) // Disable ScrollView when at the top and not fully expanded
    }
}

struct WaterfallGrid<Item: Identifiable, Content: View>: View {
    let items: Binding<[Item]>
    let columns: Int
    let spacing: CGFloat
    let content: (Binding<Item>) -> Content
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(0..<columns, id: \.self) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(Array(items.wrappedValue.enumerated().filter { $0.offset % columns == column }), id: \.element.id) { index, _ in
                        content(items[index])
                    }
                }
            }
        }
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}





//
//import SwiftUI
//
//struct ContentSheet: View {
//    @State private var selectedFilter: TabBarContentFilter = .posts
//    @Namespace var animation
//    let progress: CGFloat
//    let maxOffset: CGFloat
//
//    @State private var posts: [Post] = Post.samplePosts()
//
//    let columns = 2
//    let spacing: CGFloat = 12
//
//    @State private var scrollOffset: CGFloat = 0.0
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .top) {
//                VStack(spacing: 0) {
//                    // Header content
//                    headerContent
//
//                    ContentFilterTabBarWrapper(selectedFilter: $selectedFilter, animation: animation, progress: progress)
//                        .offset(y: progress >= 0.99 ? -140 : 0)
//
//                    CustomScrollView(isScrollEnabled: progress >= 0.99) {
//                        VStack {
//                            WaterfallGrid(items: $posts, columns: columns, spacing: spacing) { $post in
//                                PostView(post: $post, width: (geometry.size.width - spacing * CGFloat(columns + 1)) / CGFloat(columns))
//                            }
//                            .padding(12)
//                            .background(Color(.white))
//
//                            Text("End")
//                                .font(.footnote)
//                                .foregroundColor(.secondary)
//                                .frame(maxWidth: .infinity, alignment: .center)
//                                .padding(.vertical, 20)
//                                .padding(.bottom, 120)
//                        }
//                    }
//                    .scrollIndicators(.hidden)
//                    .gesture(DragGesture()
//                        .onChanged { value in
//                            scrollOffset = value.translation.height
//                        }
//                        .onEnded { value in
//                            withAnimation {
//                                scrollOffset = 0
//                            }
//                        }
//                    )
//                    .offset(y: progress >= 0.99 ? -140 : 0)
//                }
//                .frame(height: geometry.size.height + (progress >= 0.99 ? 140 : 0))
//
//                Capsule()
//                    .fill(progress >= 0.99 ? Color.black.opacity(0.4) : Color.white.opacity(0.4))
//                    .frame(width: 32, height: 4)
//                    .padding(.top, 8)
//                    .zIndex(1)
//            }
//        }
//        .frame(maxWidth: .infinity)
//        .background(Color(.white))
//        .cornerRadius(32)
//    }
//
//    private var headerContent: some View {
//        ZStack {
//            GeometryReader { imageGeometry in
//                ZStack {
//                    Image("study")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: imageGeometry.size.width * 1.06, height: 140)
//
//                    LinearGradient(
//                        gradient: Gradient(stops: [
//                            .init(color: Color(hex: 0x111111).opacity(0.1), location: 0),
//                            .init(color: Color(hex: 0x111111).opacity(0.2), location: 0.4),
//                            .init(color: Color(hex: 0x222222).opacity(0.45), location: 0.55),
//                            .init(color: Color(hex: 0x444444).opacity(0.75), location: 0.70),
//                            .init(color: Color(hex: 0x444444).opacity(0.95), location: 0.85),
//                            .init(color: Color(hex: 0x444444).opacity(1), location: 1)
//                        ]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//
//                    Color.black.opacity(0.20)
//                }
//                .frame(width: imageGeometry.size.width, height: 140)
//                .clipShape(Rectangle())
//            }
//
//            ContentProfileWrapper()
//        }
//        .frame(height: 140)
//        .offset(y: progress >= 0.99 ? -140 : 0)
//    }
//}
//
//struct TestBottomSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentSheet(progress: 0.5, maxOffset: 300)
//    }
//}
//
//struct WaterfallGrid<Item: Identifiable, Content: View>: View {
//    let items: Binding<[Item]>
//    let columns: Int
//    let spacing: CGFloat
//    let content: (Binding<Item>) -> Content
//
//    var body: some View {
//        HStack(alignment: .top, spacing: spacing) {
//            ForEach(0..<columns, id: \.self) { column in
//                LazyVStack(spacing: spacing) {
//                    ForEach(Array(items.wrappedValue.enumerated().filter { $0.offset % columns == column }), id: \.element.id) { index, _ in
//                        content(items[index])
//                    }
//                }
//            }
//        }
//    }
//}
//
//// Custom ScrollView to enable/disable scrolling
//struct CustomScrollView<Content: View>: View {
//    var isScrollEnabled: Bool
//    let content: () -> Content
//
//    var body: some View {
//        ScrollView(isScrollEnabled ? .vertical : []) {
//            content()
//        }
//    }
//}
