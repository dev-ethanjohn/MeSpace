import SwiftUI

struct BottomSheetView: View {
    @Binding var offset: CGFloat
    @State private var selectedFilter: TabBarContentFilter = .posts
    @Namespace var animation
    @Binding var showProfileName: Bool
    
    
    private let imageHeight: CGFloat = 140
    
    private let maxProgressThreshold: CGFloat = 0.99
    
    var body: some View {
        GeometryReader { geometry in
            let progress = calculateProgress(geometry: geometry)
            
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    ProfileHeaderView(progress: progress, imageHeight: imageHeight)
                    BottomSheetTabBarView(selectedFilter: $selectedFilter, animation: animation, progress: progress, imageHeight: imageHeight)
                    ScrollView {
                        BottomSheetContentView(geometry: geometry, progress: progress, imageHeight: imageHeight)
                    }
                    .background(Color.white)
                    .offset(y: progress > maxProgressThreshold ? -imageHeight : 0)
                }
                .background(.clear)
            }
            .frame(height: calculateSheetHeight(geometry: geometry, progress: progress))
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .shadow(color: Color.black.opacity(0.16), radius: 4, x: 0, y: -2)
            .onChange(of: progress) { oldValue, newValue in
                if newValue >= maxProgressThreshold && oldValue < maxProgressThreshold {
                    showProfileName = true
                } else if newValue < maxProgressThreshold && oldValue >= maxProgressThreshold {
                    showProfileName = false
                }
            }
        }
    }
    
    private func calculateProgress(geometry: GeometryProxy) -> CGFloat {
        let maxHeight = UIScreen.main.bounds.height - 60
        return min(1, max(0, -offset / (maxHeight - 540)))
    }
    
    private func calculateSheetHeight(geometry: GeometryProxy, progress: CGFloat) -> CGFloat {
        geometry.size.height + (progress > maxProgressThreshold ? imageHeight : 0)
    }
}

struct BottomSheetCustom_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            BottomSheetView(offset: .constant(0), showProfileName: .constant(false))
        }
    }
}

