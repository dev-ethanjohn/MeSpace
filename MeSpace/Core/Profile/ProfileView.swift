import SwiftUI

struct ProfileView: View {
    @State private var offset: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    
    @State private var showProfileName: Bool = false
    @State private var isBottomSheetVisible: Bool = true
    
    var body: some View {
            ZStack(alignment: .bottom) {
                CustomSpaceView(
                    showProfileName: $showProfileName,
                    isBottomSheetVisible: $isBottomSheetVisible
                )
                .ignoresSafeArea()
                
                GeometryReader { reader in
                    BottomSheetView(
                        offset: $offset,
                        showProfileName: $showProfileName,
                        isVisible: $isBottomSheetVisible
                    )
                    .offset(y: reader.frame(in: .global).height - 500)
                    .offset(y: offset)
                    .bottomSheetDragGesture(offset: $offset, lastDragValue: $lastDragValue, reader: reader)
                }
                .ignoresSafeArea(edges: .bottom)
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
