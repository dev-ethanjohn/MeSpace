import SwiftUI
import UIKit

struct OwnPostDetailedView: View {
    let post: Post
    @Environment(\.dismiss) private var dismiss
    @Namespace var animation
    
    @State private var commentText: String = ""
    @State private var rotationDegrees: Double = 0
    @State private var isDragging = false

    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        Section {
                            postImageView
                            PostDescriptionView()
                        } header: {
                            PostHeaderView()
                        }
                        
                        PostCommentsView()
                    }
                    .padding(0)
                }
                .background(Color(.systemGray).opacity(0.1))
                .scrollIndicators(.hidden)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack(spacing: 8) {
                            Button(action: {
                                dismissView()
                            }) {
                                Image(systemName: "chevron.backward")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .rotationEffect(.degrees(rotationDegrees))
                                    .animation(.spring(response: 0.2, dampingFraction: 0.8, blendDuration: 0.1), value: rotationDegrees)
                            }
                            
                            userInfoView
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Action for search button
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .toolbarBackground(Color.white, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .tint(.black)
                
                CommentInputView(commentText: $commentText)
                    .ignoresSafeArea(edges: .bottom)
            }
            .navigationBarBackButtonHidden(true)
//            .gesture(dragGesture)
 
        }
        .gesture(dragGesture)
        .transition(.asymmetric(
            insertion: .identity,
            removal: .opacity.combined(with: .move(edge: .trailing))
        ))
    }
    
    private var postImageView: some View {
        Group {
            if let uiImage = UIImage(named: post.imageURL) {
                GeometryReader { geometry in
                    let screenWidth = geometry.size.width
                    let aspectRatio = CGFloat(uiImage.size.height) / CGFloat(uiImage.size.width)
                    let imageHeight = min(screenWidth * aspectRatio, 900)
                    
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: screenWidth, height: imageHeight)
                        .clipped()
                        .matchedGeometryEffect(id: "image\(post.id)", in: animation)
                }
                .frame(height: calculateImageHeight(for: uiImage))
            } else {
                Color.gray
                    .frame(height: 200)
            }
        }
    }
    
    private var dragGesture: some Gesture {
        DragGesture()
                  .onChanged { value in
                      let dragDistance = value.translation.height
                      let rotationThreshold: CGFloat = 10

                      // Rotate to -90 degrees if dragged past the threshold
                      withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
                          rotationDegrees = dragDistance > rotationThreshold ? -90 : 0
                      }
                  }
                  .onEnded { value in
                      let dismissThreshold: CGFloat = 10 // Adjust this value as needed
                      if value.translation.height > dismissThreshold || value.predictedEndTranslation.height > dismissThreshold {
                          dismissView()
                      } else {
                          // Always reset to 0 degrees if not dismissing
                          withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                              rotationDegrees = 90
                          }
                      }
                  }
     }
     
     private func dismissView() {
         withAnimation(.spring(response: 0.2, dampingFraction: 0.7, blendDuration: 0.1)) {
             rotationDegrees = -90
         }
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
             dismiss()
         }
     }
      
    
    private func calculateImageHeight(for image: UIImage) -> CGFloat {
        let imageWidth = CGFloat(image.size.width)
        let imageHeight = CGFloat(image.size.height)
        let aspectRatio = imageHeight / imageWidth
        let screenWidth = UIScreen.main.bounds.width
        let calculatedHeight = CGFloat(screenWidth) * aspectRatio
        return min(calculatedHeight, 900)
    }
    
    private var userInfoView: some View {
        HStack(spacing: 12) {
            Image("ej")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 28)
                .clipShape(Circle())
            
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


extension AnyTransition {
    static var smoothDismissal: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: .opacity.combined(with: .move(edge: .trailing))
        )
    }
}


