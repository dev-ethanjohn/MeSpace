import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                ScrollView {
                    RegistrationFormView()
                }
                .padding()
                
                Spacer()
                
                SignInPromptView(dismiss: dismiss)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.size.height)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
