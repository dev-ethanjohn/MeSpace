import SwiftUI

struct ContentProfileWrapper: View {
    var body: some View {
        ZStack(alignment: .top) {
            ContentProfileInfoView()
        }
        .frame(maxHeight: 140)
    }
}

struct TestProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentProfileWrapper()
    }
}
