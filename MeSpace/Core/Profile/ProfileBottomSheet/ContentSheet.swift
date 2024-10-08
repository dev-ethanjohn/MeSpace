
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
    
    @State private var scrollToTop: Bool = false // automatic scroll to the top
    @State private var selectedPost: Post? // Track the selected post
    
    let columns = 2
    let spacing: CGFloat = 10
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    VStack(spacing: 0) {
                        // Header content
                        headerContent
                        
                        ZStack(alignment: .top) {
                            CustomScrollView(
                                isFullyExpanded: progress >= 0.99,
                                scrollOffset: $scrollViewOffset,
                                startOffset: $startOffset,
                                isScrolling: $isScrolling,
                                progress: progress,
                                scrollToTop: $scrollToTop
                            ) {
                                VStack {
                                    WaterfallGrid(items: posts, columns: columns, spacing: spacing) { post in
                                        PostView(post: post, width: (geometry.size.width - spacing * CGFloat(columns + 1)) / CGFloat(columns))
                                            .matchedGeometryEffect(id: post.id, in: animation)
                                            .onTapGesture {
                                                selectedPost = post
                                            }
                                    }
                                    .padding(.top, 48)
                                    .padding(12)
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
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(height: 50) // Adjust this value to match your tab bar height
                                    .shadow(color: Color.black.opacity(progress >= 0.99 ? 0.16 : 0), radius: 10, x: 0, y: 10)
                                
                                ContentFilterTabBarWrapper(selectedFilter: $selectedFilter, animation: animation, progress: progress, scrollToTop: $scrollToTop)
                            }
                            .offset(y: progress >= 0.99 ? -140 : 0)
                            
                        }
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
                    /*  scrollViewOffset = max(0, scrollViewOffset)*/ // Allow keeping upward scroll, reset only if scrolled down
                    scrollViewOffset = 0
                    startOffset = 0 // Reset start offset
                    isScrolling = false // Disable scrolling when progress is less than 0.99
                }
            }
            .sheet(item: $selectedPost) { post in
                           OwnPostDetailedView(post: post)
                       }

        }
//        .sheet(item: $selectedPost) { post in
//                       OwnPostDetailedView(post: post)
//                   }
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
    @Binding var scrollToTop: Bool
    let content: () -> Content
    
    
    var body: some View {
        ScrollViewReader { proxy in
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
                    if isFullyExpanded {
                        scrollOffset = startOffset - value
                        isScrolling = scrollOffset > 0
                    }
                }
                .id("scroll_to_top")
                
                content()
            }
            .onChange(of: scrollToTop) { _, newValue in
                if newValue && isFullyExpanded {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        proxy.scrollTo("scroll_to_top", anchor: .top)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        scrollToTop = false
                    }
                }
            }
            .simultaneousGesture(
                DragGesture()
                    .onChanged { _ in
                        if !isFullyExpanded {
                            startOffset = 0
                            scrollOffset = 0
                        }
                    }
            )
            
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
        //        .disabled(!isFullyExpanded && scrollOffset <= 0) // Disable ScrollView when at the top and not fully expanded
        .disabled(!isFullyExpanded)
    }
}

struct WaterfallGrid<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let columns: Int
    let spacing: CGFloat
    let content: (Item) -> Content
    
    init(items: [Item], columns: Int, spacing: CGFloat, @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.columns = columns
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(0..<columns, id: \.self) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(Array(items.enumerated().filter { $0.offset % columns == column }), id: \.element.id) { _, item in
                        content(item)
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




