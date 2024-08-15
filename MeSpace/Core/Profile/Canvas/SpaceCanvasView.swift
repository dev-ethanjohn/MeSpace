import SwiftUI

struct SpaceCanvasView: View {
    @State private var isSheetPresented = false
    let defaultSheetHeight: CGFloat = 0.1 // 90% of screen height
    let sheetCornerRadius: CGFloat = 24
    
    
    @State private var blurType: BlurType = .freestyle
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("sad")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width * 1.0, maxHeight: UIScreen.main.bounds.height * 1.0)
                .ignoresSafeArea()
                .zIndex(0)
            

           
            ScrollView {
                VStack(spacing: 16) {
                    SpaceContainer()
                    
                    GeometryReader { geometry in
                        HStack(spacing: 12) {
                            LinksContainerView()
                                .frame(width: (geometry.size.width - 12) / 2)
                        }
                    }
                    .frame(height: 80)
                    
                    
                    GeometryReader { geometry in
                        HStack(spacing: 12) {
                            VStack {
                                Text("Likes 👍")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                            }
                            .padding(8)
                            .frame(height: 80)
                            .frame(width: (geometry.size.width - 12) / 2)
                            .background(Color(hex: 0xceed8e))
                            .clipShape(.capsule)
                            
                            VStack {
                                Text("Dislikes")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                            .padding(8)
                            .frame(height: 80)
                            .frame(width: (geometry.size.width - 12) / 2)
                            .background(Color(hex: 0xe8561c))
                
                            

                        }
                    }
                    .frame(height: 80)
                    
                    
                    VStack {
                        Text("Friends")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                    .padding(8)
                    .frame(maxHeight: UIScreen.main.bounds.size.width)
                    .background(Color(hex: 0xffffff))
                    
                }
                .padding(.horizontal, 16)
                .padding(.top, UIScreen.main.bounds.size.height * 0.01)
            }
            .padding(.top, 120)
            .ignoresSafeArea(edges: .top)
            .scrollIndicators(.hidden)
            
            ZStack(alignment: .bottom) {
                
                BlurView()
                    .blur(radius: 0.8)
                
                
                BlurView()
                    .blur(radius: 8)
                    .frame(maxHeight: 90)
                
                
                BlurView()
                    .blur(radius: 20)
                    .frame(maxHeight: 70)
                        
                
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color(hex: 0x000000).opacity(0), location: 0),
                        .init(color: Color(hex: 0x000000).opacity(0.05), location: 0.2),
                        .init(color: Color(hex: 0x000000).opacity(0.15), location: 0.4),
                        .init(color: Color(hex: 0x000000).opacity(0.35), location: 0.6),
                        .init(color: Color(hex: 0x000000).opacity(0.55), location: 0.8),
                        .init(color: Color(hex: 0x000000).opacity(0.75), location: 1)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
            
                
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .top, spacing: 16) {
                        Button {
                            isSheetPresented =  true
                            print("Open comment wall")
                        } label: {
                            Image(systemName: "ellipsis.bubble.fill")
                                .font(.system(size: 16))
                                .foregroundStyle(Color(.black))
                                .padding(10)
                                .background(Color(.white).opacity(0.8))
                                .background(Material.ultraThin.opacity(0.6))
                                .clipShape(.capsule)
                        }
                        .shadow(color: Color.black.opacity(0.24), radius: 3, x: 0, y: 3)
        
                        Button {
                            print("Edit Profile")
                        } label: {
                            Text("Customize Space")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.black))
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .background(Color(.white).opacity(0.8))
                                .background(Material.ultraThin.opacity(0.6))
                                .clipShape(.capsule)
                        }
                        .shadow(color: Color.black.opacity(0.24), radius: 3, x: 0, y: 3)
                    
                        
                        
                        Spacer()
                    }
//                    .frame(height: 80)
        
                    
                    Spacer()
                }
                .padding(16)
                .frame(height: 120)
               
            }
            .frame(maxHeight: 90)
            .frame(maxWidth: UIScreen.main.bounds.size.width * 1.0)

            
            // overlay gradient on contents when is sheet is opened
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(hex: 0x000000).opacity(0), location: 0),
                    .init(color: Color(hex: 0x000000).opacity(0.05), location: 0.2),
                    .init(color: Color(hex: 0x000000).opacity(0.15), location: 0.4),
                    .init(color: Color(hex: 0x000000).opacity(0.25), location: 0.6),
                    .init(color: Color(hex: 0x000000).opacity(0.45), location: 0.8),
                    .init(color: Color(hex: 0x000000).opacity(0.65), location: 1)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .opacity(isSheetPresented ? 1 : 0)
            .animation(.easeInOut(duration: 0.3), value: isSheetPresented)
            
        }
        .sheet(isPresented: $isSheetPresented) {
            ZStack {
                CommentWallSheet()
                    .presentationDetents([
                        .height(UIScreen.main.bounds.height * defaultSheetHeight),
                        .medium,
                        .large
                    ])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(sheetCornerRadius)
            }
            .interactiveDismissDisabled(true)
        }
    }
}

struct CommentWallSheet: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(spacing: 0) {
            // Sticky Comment Wall Sheet title
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Comment Wall")
                        .font(.headline)
                    
                    Spacer ()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .foregroundStyle(.black)
                .fontWeight(.bold)
                
                Divider()
            }
            .frame(height: 46)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("")
            
            // Scrollable comments
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(0..<20) { index in
                        Text("This is comment \(index + 1). Allow replies ")
                            .padding(12)
                            .background(Color.yellow)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}





