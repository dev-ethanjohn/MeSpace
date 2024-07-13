import SwiftUI

struct BottomSheetContentView: View {
    let geometry: GeometryProxy
    let progress: CGFloat
    let imageHeight: CGFloat
    
    var body: some View {
        VStack {
            Spacer()
            Text("You've created your first post!")
                .padding()
                .font(.subheadline)
                .foregroundStyle(Color(.lightGray))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            PostView()
            
            Text("⏤ End ⏤")
            Color.clear.frame(height: calculateBottomPadding())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func calculateBottomPadding() -> CGFloat {
        geometry.size.height + (progress > 0.99 ? imageHeight : 0) - 240
    }
}

struct BottomSheetContentView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            BottomSheetContentView(geometry: geometry, progress: 0.5, imageHeight: 140)
        }
    }
}

