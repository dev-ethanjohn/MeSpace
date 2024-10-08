import SwiftUI

struct ProfileView: View {
    @State private var offset: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    @Binding var isBottomSheetVisible: Bool
    @State private var isHeaderTextVisible: Bool = false
    @State private var blurType: BlurType = .freestyle
    @Binding var isTabBarVisible: Bool // track visibility of the customtabview
    
    private let textYPosition: CGFloat = 152 // Adjust this value as needed
    
    @State private var chevronScale: CGFloat = 1.0
    @State private var chevronOffset: CGFloat = 0
    
    @State private var isMenuActive: Bool = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let progress = calculateProgress(maxOffset: geometry.size.height * 0.1)
                let screenHeight = geometry.size.height
                let bottomSheetHeight = screenHeight * 1
                
                ZStack {
                    // Base layer: SpaceCanvasView
                    SpaceCanvasView()
                        .background(.white)
                        .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
                    
                    // Overlay layer: Bottom sheet and blur effects
                    ZStack(alignment: .top) {
                        // Dimming overlay
                        Color.black.opacity(0.16)
                            .opacity(isBottomSheetVisible ? 1 : 0)
                        
                        if isBottomSheetVisible {
                            // Blur and quote
                            ZStack {
                                BlurView(removeAllFilters: true)
                                    .blur(radius: 40, opaque: blurType == .freestyle)
                                
                                Text("Above all else, guard your heart, for everything you do flows from it. —Proverbs 4:23")
                                    .padding()
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color(.white))
                                    .cornerRadius(10)
                                    .opacity(1 - progress)
                                    .position(x: geometry.size.width / 2, y: textYPosition)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                        // Bottom sheet
                        VStack {
                            Spacer()
                            //                        ContentSheet(progress: progress, maxOffset: screenHeight * 0.15)
                            ContentSheet(progress: progress, maxOffset: screenHeight * 0.1)
                                .frame(height: bottomSheetHeight)
                                .offset(y: calculateBottomSheetOffset(screenHeight: screenHeight, bottomSheetHeight: bottomSheetHeight))
                                .bottomSheetDragGesture(offset: $offset, lastDragValue: $lastDragValue, reader: geometry)
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
                    .ignoresSafeArea()
                    
                    // Top layer: ProfileHeader
                    VStack {
                                          
                                          ProfileHeader(isBottomSheetVisible: $isBottomSheetVisible,
                                                        offset: $offset,
                                                        lastDragValue: $lastDragValue,
                                                        geometry: geometry,
                                                        progress: progress,
                                                        isHeaderTextVisible: $isHeaderTextVisible)
                                          .padding(.top, 50)
                                          Spacer()
                                      }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation(.spring(response: 0.8, dampingFraction: 0.8)) {
                                    chevronScale = 0.8
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isTabBarVisible = true
                                        chevronOffset = 100 // Move down by 100 points
                                        offset = 0 // Reset offset to show the tab bar
                                    }
                                }
                            }) {
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 30))
                                    .foregroundColor(.black)
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 60, height: 60)
                            .background(Material.thin)
                            .clipShape(Circle())
                            .scaleEffect(chevronScale)
                            .offset(y: chevronOffset)
                            .opacity(isTabBarVisible ? 0 : 1)
                            .animation(.easeInOut(duration: 0.3), value: isTabBarVisible)
                            .shadow(color: Color.black.opacity(0.24), radius: 3, x: 0, y: 3)
                        }
                    }
                    .padding(.trailing, 12)
                    .padding(.bottom, 48)
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                                    chevronScale = 0.8
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(.easeInOut(duration: 0.3)) {
                                        isTabBarVisible = true
                                        chevronOffset = 100 // Move down by 100 points
                                        offset = 0 // Reset offset to show the tab bar
                                    }
                                }
                            }) {
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 36))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            .frame(width: 60, height: 60)
                            .background(Material.ultraThin)
                            .clipShape(Circle())
                            .scaleEffect(chevronScale)
                            .offset(y: chevronOffset)
                            .opacity(isTabBarVisible ? 0 : 1)
                            .animation(.easeInOut(duration: 0.3), value: isTabBarVisible)
                            .shadow(color: Color.black.opacity(0.24), radius: 3, x: 0, y: 3)
                        }
                    }
                    .padding(.trailing, 12)
                    .padding(.bottom, 48)
                    
                }
                .edgesIgnoringSafeArea(.all)
                //            .onChange(of: offset) { _, newOffset in
                //                let newProgress = calculateProgress(maxOffset: geometry.size.height * 0.15)
                //                withAnimation(.easeInOut(duration: 0.3)) {
                //                    isHeaderTextVisible = newProgress >= 0.99 && isBottomSheetVisible
                //                    isTabBarVisible = !(newProgress >= 0.99 && isBottomSheetVisible)
                //                }
                //            }
                .onChange(of: offset) { _, newOffset in
                    let newProgress = calculateProgress(maxOffset: geometry.size.height * 0.1)
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isHeaderTextVisible = newProgress >= 0.99 && isBottomSheetVisible
                        if !(newProgress >= 0.99 && isBottomSheetVisible) {
                            isTabBarVisible = true
                            chevronScale = 1.0
                            chevronOffset = 0
                        } else {
                            isTabBarVisible = false
                        }
                    }
                }
                .onChange(of: isBottomSheetVisible) { _, newValue in
                    if !newValue {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isHeaderTextVisible = true
                            offset = 0
                        }
                    }
                }
            }
        }
    }
    
    private func calculateProgress(maxOffset: CGFloat) -> CGFloat {
        return min(1, max(0, offset / maxOffset))
    }
    
    private func calculateBottomSheetOffset(screenHeight: CGFloat, bottomSheetHeight: CGFloat) -> CGFloat {
        if isBottomSheetVisible {
            return max(0, screenHeight * 0.225 - offset) // Prevent negative offset
        } else {
            return screenHeight
        }
    }
}

