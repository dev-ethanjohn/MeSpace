
import SwiftUI




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

