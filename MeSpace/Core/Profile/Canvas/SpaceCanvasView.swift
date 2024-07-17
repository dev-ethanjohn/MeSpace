import SwiftUI

struct SpaceCanvasView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.systemGray).opacity(0.2)
                    .ignoresSafeArea()
                
                VStack {
                    
                    SpaceContainer()
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                .padding(.top, UIScreen.main.bounds.size.height * 0.05)
                .padding()
            }
        }
    }
}

struct SpaceCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceCanvasView()
    }
}
