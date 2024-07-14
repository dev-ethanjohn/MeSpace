import SwiftUI

struct ProfileView: View {
    @State private var offset: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CustomSpaceView()
                .ignoresSafeArea()
            
            GeometryReader { reader in
                BottomSheetView(offset: $offset)
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
