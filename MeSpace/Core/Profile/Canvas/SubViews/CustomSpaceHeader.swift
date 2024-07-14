import SwiftUI

struct CustomSpaceHeader: View {
    
    @State private var showMeLoginView = false
    @State private var textOpacity: Double = 0
    
    @Binding var showProfileName: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "pencil")
                        .padding()
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                })
                
                Spacer()
                
                if showProfileName {
                    Text("Ethan John Paguntalan 💻")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.6)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(.black)
                        .opacity(textOpacity)
                        .padding(.horizontal, 4)
                }
                Spacer()
                
                Button(action: {
                    showMeLoginView = true
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .padding()
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                })
            }
            .padding()
            .tint(.black)
        }
        .frame(height: 20)
        .padding(.bottom, 20)
        .padding(.top, getSafeAreaTopPadding())
        .background(Color(.white))
        .onChange(of: showProfileName) { _, newValue in
            withAnimation(.easeInOut(duration: 0.5)) {
                textOpacity = newValue ? 1 : 0
            }
        }
        .fullScreenCover(isPresented: $showMeLoginView) {
            NavigationStack {
                LoginView(email: "", password: "")
            }
        }
    }
    
    // Function to get the top safe area padding
    private func getSafeAreaTopPadding() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.safeAreaInsets.top ?? 0
    }
}

struct CanvasHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSpaceHeader(showProfileName: .constant(false))
    }
}
