import SwiftUI

struct ExploreView: View {
    @Binding var isTabBarVisible: Bool
    @State private var posts: [Post] = Post.samplePosts()
    @State private var selectedPost: Post?
    @State private var isShowingDetail = false
    
    let columns = 2
    let spacing: CGFloat = 10
    
    var body: some View {
        VStack(spacing: 0) {
            CustomHeader()
            
            GeometryReader { geometry in
                ScrollView {
                    WaterfallGrid(items: posts, columns: columns, spacing: spacing) { post in
                        PostView(post: post, width: (geometry.size.width - spacing * CGFloat(columns + 1)) / CGFloat(columns))
                            .onTapGesture {
                                selectedPost = post
                                isShowingDetail = true
                                isTabBarVisible = false
                            }
                    }
                    .padding(12)
                    .background(Color.white)
                }
                .scrollIndicators(.hidden)
            }
        }
        .sheet(isPresented: $isShowingDetail, onDismiss: {
            isTabBarVisible = true
        }) {
            if let post = selectedPost {
                PostDetailView(post: post, isTabBarVisible: $isTabBarVisible)
                    .presentationDetents([.height(UIScreen.main.bounds.height * 0.87)])
            }
        }
    }
}

struct CustomHeader: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center) {
                Text("Explore")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 24)
        }
        .frame(maxWidth: UIScreen.main.bounds.size.width)
        .frame(height: 40)
        .background(.white)
    }
}

struct PostDetailView: View {
    let post: Post
    @Environment(\.dismiss) var dismiss
    @State private var showUserProfile = false
    
    @Binding var isTabBarVisible: Bool
     @State private var isBottomSheetVisible = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("street1")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.size.width)
                    .frame(height: 300)
                    .clipped()
                
                Spacer()
                Text("Detail view for post: \(post.id)")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 16) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                        
                        userInfoView
                        
                        Spacer(minLength: 1)
                        
                        Button {
                            // Follow action
                        } label: {
                            Text("Follow")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .font(.footnote)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 10)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $showUserProfile) {
                           ProfileView(isBottomSheetVisible: $isBottomSheetVisible, isTabBarVisible: $isTabBarVisible)
                    .navigationBarBackButtonHidden(true)
                    
            }
            
        }
    }
    
    private var userInfoView: some View {
        HStack(spacing: 12) {
            Image("ej")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 28)
                .clipShape(Circle())
                .onTapGesture {
                                 showUserProfile = true
                             }
            
            VStack(alignment: .leading, spacing: -2) {
                Text("Ethan John Paguntalan 💻")
                    .font(.subheadline)
                    .fontWeight(.bold)
                  
                Text("@only_ej")
                    .font(.footnote)
                    .foregroundStyle(Color(.darkGray))
            }
        }
    }
}

// Preview remains the same

