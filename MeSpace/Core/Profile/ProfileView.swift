
import SwiftUI
//
//struct ProfileView: View {
//    @State private var offset: CGFloat = 0
//    @State private var lastDragValue: CGFloat = 0
//    @Binding var isBottomSheetVisible: Bool
//    @State private var isHeaderTextVisible: Bool = false
//    
//    @State private var blurType: BlurType = .freestyle
//    
//    private let textYPosition: CGFloat = 152 // Adjust this value as needed
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let progress = calculateProgress(geometry: geometry)
//            let screenHeight = geometry.size.height
//            let bottomSheetHeight = screenHeight * 1
//            
//            
//            ZStack(alignment: .top) {
//                
//                
//                ProfileHeader(isBottomSheetVisible: $isBottomSheetVisible,
//                              offset: $offset,
//                              lastDragValue: $lastDragValue,
//                              geometry: geometry,
//                              progress: progress,
//                              isHeaderTextVisible: $isHeaderTextVisible
//                )
//                .zIndex(1)
//                
//                SpaceCanvasView()
//                    .background(.white)
//                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
//                
//                Color.black.opacity(0.16)
//                    .ignoresSafeArea()
//                    .opacity(isBottomSheetVisible ? 1 : 0)
//                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
//                
//                if isBottomSheetVisible {
//                    ZStack {
//                        BlurView(removeAllFilters: true)
//                            .blur(radius: 40, opaque: blurType == .freestyle)
//                        
////                        TEXT OPTIONAL
//                                                Text("Above all else, guard your heart, for everything you do flows from it. —Proverbs 4:23")
//                                                    .padding()
//                                                    .padding()
//                                                    .font(.callout)
//                                                    .fontWeight(.semibold)
//                                                    .foregroundStyle(Color(.white))
//                                                    .cornerRadius(10)
//                                                    .opacity(1 - progress)
//                                                    .position(x: geometry.size.width / 2, y: textYPosition)
//                                                    .multilineTextAlignment(.center)
//                    }
//                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
//                    .ignoresSafeArea()
//                }
//                
//                ZStack(alignment: .bottom) {
//                    ContentSheet(progress: progress, maxOffset: screenHeight * 0.175)
//                        .shadow(color: Color.black.opacity(0.16), radius: 3, x: 0, y: -3)
//                        .frame(height: bottomSheetHeight)
//                        .offset(y: calculateBottomSheetOffset(screenHeight: screenHeight, bottomSheetHeight: bottomSheetHeight))
//                        .bottomSheetDragGesture(offset: $offset, lastDragValue: $lastDragValue, reader: geometry)
//                        .animation(.spring(), value: isBottomSheetVisible)
//                }
//                
//                
//            }
//            .edgesIgnoringSafeArea(.bottom)
//            .onChange(of: progress) { _, newProgress in
//                if newProgress >= 0.99 && isBottomSheetVisible {
//                    withAnimation(.easeInOut(duration: 0.3)) {
//                        isHeaderTextVisible = true
//                    }
//                } else if isBottomSheetVisible {
//                    withAnimation(.easeInOut(duration: 0.3)) {
//                        isHeaderTextVisible = false
//                    }
//                }
//            }
//            .onChange(of: isBottomSheetVisible) { _, newValue in
//                if !newValue {
//                    withAnimation(.easeInOut(duration: 0.3)) {
//                        isHeaderTextVisible = true
//                    }
//                }
//            }
//        }
//    }
//    
//    private func calculateProgress(geometry: GeometryProxy) -> CGFloat {
//        let maxOffset = geometry.size.height * 0.175
//        return min(1, max(0, offset / maxOffset))
//    }
//    
//    private func calculateBottomSheetOffset(screenHeight: CGFloat, bottomSheetHeight: CGFloat) -> CGFloat {
//        if isBottomSheetVisible {
//            return screenHeight * 0.25 - offset //default position (40% from the top)
//        } else {
//            return screenHeight + 40 // offset to make the bottomsheet move out
//        }
//    }
//}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(isBottomSheetVisible: .constant(true))
//    }
//}


//struct ProfileView: View {
//    @State private var offset: CGFloat = 0
//    @State private var lastDragValue: CGFloat = 0
//    @Binding var isBottomSheetVisible: Bool
//    @State private var isHeaderTextVisible: Bool = false
//    
//    @State private var blurType: BlurType = .freestyle
//    
//    private let textYPosition: CGFloat = 152 // Adjust this value as needed
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let progress = calculateProgress(geometry: geometry)
//            let screenHeight = geometry.size.height
//            let bottomSheetHeight = screenHeight * 1
//            
//            ZStack(alignment: .top) {
//                SpaceCanvasView()
//                    .background(.white)
//                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
//                
//                Color.black.opacity(0.16)
//                    .ignoresSafeArea()
//                    .opacity(isBottomSheetVisible ? 1 : 0)
//                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
//                
//                if isBottomSheetVisible {
//                    ZStack {
//                        BlurView(removeAllFilters: true)
//                            .blur(radius: 40, opaque: blurType == .freestyle)
//                        
//                        Text("Above all else, guard your heart, for everything you do flows from it. —Proverbs 4:23")
//                            .padding()
//                            .padding()
//                            .font(.callout)
//                            .fontWeight(.semibold)
//                            .foregroundStyle(Color(.white))
//                            .cornerRadius(10)
//                            .opacity(1 - progress)
//                            .position(x: geometry.size.width / 2, y: textYPosition)
//                            .multilineTextAlignment(.center)
//                    }
//                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
//                    .ignoresSafeArea()
//                }
//                
//                ZStack(alignment: .bottom) {
//                    ContentSheet(progress: progress, maxOffset: screenHeight * 0.175)
//                        .shadow(color: Color.black.opacity(0.16), radius: 3, x: 0, y: -3)
//                        .frame(height: bottomSheetHeight)
//                        .offset(y: calculateBottomSheetOffset(screenHeight: screenHeight, bottomSheetHeight: bottomSheetHeight))
//                        .bottomSheetDragGesture(offset: $offset, lastDragValue: $lastDragValue, reader: geometry)
//                        .animation(.spring(), value: isBottomSheetVisible)
//                }
//                
//                ProfileHeader(isBottomSheetVisible: $isBottomSheetVisible,
//                              offset: $offset,
//                              lastDragValue: $lastDragValue,
//                              geometry: geometry,
//                              progress: progress,
//                              isHeaderTextVisible: $isHeaderTextVisible)
//                    .zIndex(2)
//            }
//            .edgesIgnoringSafeArea(.bottom)
//            .onChange(of: progress) { _, newProgress in
//                withAnimation(.easeInOut(duration: 0.3)) {
//                    isHeaderTextVisible = newProgress >= 0.99 && isBottomSheetVisible
//                }
//            }
//            .onChange(of: isBottomSheetVisible) { _, newValue in
//                if !newValue {
//                    withAnimation(.easeInOut(duration: 0.3)) {
//                        isHeaderTextVisible = true
//                    }
//                }
//            }
//        }
//    }
//    
//    private func calculateProgress(geometry: GeometryProxy) -> CGFloat {
//        let maxOffset = geometry.size.height * 0.175
//        return min(1, max(0, offset / maxOffset))
//    }
//    
//    private func calculateBottomSheetOffset(screenHeight: CGFloat, bottomSheetHeight: CGFloat) -> CGFloat {
//        if isBottomSheetVisible {
//            return screenHeight * 0.25 - offset // default position (25% from the top)
//        } else {
//            return screenHeight + 40 // offset to make the bottom sheet move out
//        }
//    }
//}



struct ProfileView: View {
    @State private var offset: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    @Binding var isBottomSheetVisible: Bool
    @State private var isHeaderTextVisible: Bool = false
    @State private var blurType: BlurType = .freestyle
    
    private let textYPosition: CGFloat = 152 // Adjust this value as needed
    
    var body: some View {
        GeometryReader { geometry in
            let progress = calculateProgress(maxOffset: geometry.size.height * 0.15)
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
                                .font(.callout)
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
                        ContentSheet(progress: progress, maxOffset: screenHeight * 0.15)
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
            }
            .edgesIgnoringSafeArea(.all)
            .onChange(of: offset) { _, newOffset in
                let newProgress = calculateProgress(maxOffset: geometry.size.height * 0.15)
                withAnimation(.easeInOut(duration: 0.3)) {
                    isHeaderTextVisible = newProgress >= 0.99 && isBottomSheetVisible
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
    
    private func calculateProgress(maxOffset: CGFloat) -> CGFloat {
        return min(1, max(0, offset / maxOffset))
    }
    
    private func calculateBottomSheetOffset(screenHeight: CGFloat, bottomSheetHeight: CGFloat) -> CGFloat {
        if isBottomSheetVisible {
            return max(0, screenHeight * 0.175 - offset) // Prevent negative offset
        } else {
            return screenHeight
        }
    }
}
