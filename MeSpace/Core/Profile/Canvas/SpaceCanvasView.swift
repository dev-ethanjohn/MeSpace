import SwiftUI

struct SpaceCanvasView: View {
    var body: some View {
            ZStack(alignment: .top) {
                Image("flower")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: UIScreen.main.bounds.width * 1.0, maxHeight: UIScreen.main.bounds.height * 1.0)
                    .ignoresSafeArea(.all)
                
                VStack {
                    SpaceContainer()
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                .padding(.top, UIScreen.main.bounds.size.height * 0.05)
                .padding()
            }
    }
}

struct SpaceCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceCanvasView()
    }
}
