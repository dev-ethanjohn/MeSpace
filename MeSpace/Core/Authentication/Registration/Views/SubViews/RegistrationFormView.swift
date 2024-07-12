import SwiftUI

struct RegistrationFormView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var username = ""
    @State private var showingAlert = false
    
    @State private var showMeSpaceTabView = false
    
    var body: some View {
        VStack {
            RegistrationHeaderView()
            
            InputFieldView(placeholder: "email", text: $email)
            InputFieldView(placeholder: "password", text: $password)
            InputFieldView(placeholder: "full name", text: $fullName)
            InputFieldView(placeholder: "username", text: $username)
            
            Button("Join MeSpace now!") {
                //                showingAlert = true
                showMeSpaceTabView = true
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .padding(.vertical, 4)
            .background(Color(.black))
            .clipShape(.rect(cornerRadius: 8))
            .padding(.top, 16)
        }
        .padding(.vertical, 16)
        .padding(.horizontal)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Registration Error"), message: Text("An unknown error occurred"), dismissButton: .default(Text("OK")))
        }
        .fullScreenCover(isPresented: $showMeSpaceTabView) {
            MeSpaceTabView()
        }
    }
}

struct RegistrationFormView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationFormView()
    }
}
