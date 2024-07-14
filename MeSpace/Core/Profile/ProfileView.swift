import SwiftUI

struct ProfileView: View {
    @State private var offset: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    
    @State private var showProfileName: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CustomSpaceView(showProfileName: $showProfileName)
                .ignoresSafeArea()
            
            GeometryReader { reader in
                BottomSheetView(offset: $offset, showProfileName: $showProfileName)
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
