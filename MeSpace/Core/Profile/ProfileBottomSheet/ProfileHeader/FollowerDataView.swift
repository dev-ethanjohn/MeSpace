import SwiftUI

struct FollowerDataView: View {
    let count: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(count)
                .font(.system(size: 14, weight: .bold))
            Text(label)
                .font(.system(size: 12))
        }
    }
}

struct FollowerDataView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerDataView(count: "1,234", label: "followers")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
