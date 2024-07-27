import SwiftUI

import SwiftUI

struct ContentSheet: View {
    @State private var selectedFilter: TabBarContentFilter = .posts
    @Namespace var animation
    let progress: CGFloat
    let maxOffset: CGFloat
    
    
    
    //    let columns = [
    //        GridItem(.flexible(), spacing: 10),
    //        GridItem(.flexible(), spacing: 10)
    //    ]
    
    @State private var posts: [Post] = Post.samplePosts()
    
    let columns = 2
    let spacing: CGFloat = 12
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    // Header content
                    headerContent
                    
                    ContentFilterTabBarWrapper(selectedFilter: $selectedFilter, animation: animation, progress: progress)
                        .offset(y: progress >= 0.99 ? -140 : 0)
                    
                    ScrollView(progress >= 0.99 ? .vertical : [], showsIndicators: false) {
                        
                        VStack {
                            WaterfallGrid(items: $posts, columns: columns, spacing: spacing) { $post in
                                PostView(post: $post, width: (geometry.size.width - spacing * CGFloat(columns + 1)) / CGFloat(columns))
                            }
                            .padding(12)
                            .background(Color(.white))
                            
                            
                            Text("End")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.vertical, 20)
                                .padding(.bottom, 120)
                        }
                        
                        //                        Text("End")
                        //                            .font(.footnote)
                        //                            .foregroundColor(.secondary)
                        //                            .frame(maxWidth: .infinity, alignment: .center)
                        //                            .padding(.vertical, 20)
                        //                            .padding(.bottom, 120)
                        
                        
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


struct TestBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ContentSheet(progress: 0.5, maxOffset: 300)
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
