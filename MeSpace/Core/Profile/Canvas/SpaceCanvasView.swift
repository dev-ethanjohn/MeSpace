import SwiftUI

struct SpaceCanvasView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.white)
                    .ignoresSafeArea()
            }
            .padding(.vertical, 60)
            
        }
    }
}

struct SpaceCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceCanvasView()
    }
}
