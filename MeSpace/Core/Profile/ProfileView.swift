
import SwiftUI

struct ProfileView: View {
    @State private var offset: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    @Binding var isBottomSheetVisible: Bool
    @State private var isHeaderTextVisible: Bool = false
    
    
    var body: some View {
        GeometryReader { geometry in
            let progress = calculateProgress(geometry: geometry)
            let screenHeight = geometry.size.height
            let bottomSheetHeight = screenHeight * 1
            
            ZStack(alignment: .top) {
                ProfileHeader(isBottomSheetVisible: $isBottomSheetVisible,
                              offset: $offset,
                              lastDragValue: $lastDragValue,
                              geometry: geometry,
                              progress: progress,
                              isHeaderTextVisible: $isHeaderTextVisible
                )
                .zIndex(1)
                
                
                SpaceCanvasView()
                    .blur(radius: isBottomSheetVisible ? 2 : 0)
                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
                
                Color.black.opacity(0.28)
                    .ignoresSafeArea()
                    .opacity(isBottomSheetVisible ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: isBottomSheetVisible)
                
                
                ZStack(alignment: .bottom) {
                    ContentSheet(progress: progress, maxOffset: screenHeight * 0.325)
                        .shadow(color: Color.black.opacity(0.24), radius: 8, x: 0, y: -4)
                        .frame(height: bottomSheetHeight)
                        .offset(y: calculateBottomSheetOffset(screenHeight: screenHeight, bottomSheetHeight: bottomSheetHeight))
                        .bottomSheetDragGesture(offset: $offset, lastDragValue: $lastDragValue, reader: geometry)
                        .animation(.spring(), value: isBottomSheetVisible)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .onChange(of: progress) { _, newProgress in
                if newProgress >= 0.99 && isBottomSheetVisible {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isHeaderTextVisible = true
                    }
                } else if isBottomSheetVisible {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isHeaderTextVisible = false
                    }
                }
            }
            .onChange(of: isBottomSheetVisible) { _, newValue in
                if !newValue {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isHeaderTextVisible = true
                    }
                }
            }
        }
    }
    
    private func calculateProgress(geometry: GeometryProxy) -> CGFloat {
        let maxOffset = geometry.size.height * 0.325
        return min(1, max(0, offset / maxOffset))
    }
    
    private func calculateBottomSheetOffset(screenHeight: CGFloat, bottomSheetHeight: CGFloat) -> CGFloat {
        if isBottomSheetVisible {
            return screenHeight * 0.4 - offset //default position (40% from the top)
        } else {
            return screenHeight + 40 // offset to make the bottomsheet move out
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isBottomSheetVisible: .constant(true))
    }
}

