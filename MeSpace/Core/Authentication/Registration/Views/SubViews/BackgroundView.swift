import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Rectangle()
            .fill(Material.thin)
            .overlay(Color.white.opacity(0.2))
            .ignoresSafeArea()
            .onTapGesture {
                hideKeyboard()
            }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

#Preview {
    BackgroundView()
}
