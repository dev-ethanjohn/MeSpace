import SwiftUI

struct SignInPromptView: View {
    var dismiss: DismissAction
    
    var body: some View {
        VStack {
            Divider()
            Button(action: { dismiss() }) {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In").fontWeight(.bold)
                }
                .foregroundStyle(.black)
                .font(.footnote)
            }
            .padding(.vertical, 4)
            .padding(.bottom, 8)
        }
    }
}

struct SignInPromptView_Preview: PreviewProvider {
    static var previews: some View {
        SignInPromptViewWrapper()
    }
    
    struct SignInPromptViewWrapper:  View {
        @Environment(\.dismiss) var dismiss
        
        var body: some View {
            SignInPromptView(dismiss: dismiss)
        }
    }
}

