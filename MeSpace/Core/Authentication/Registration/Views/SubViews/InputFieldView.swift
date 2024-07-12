import SwiftUI

struct InputFieldView: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .autocapitalization(.none)
            .foregroundStyle(.black)
            .font(.subheadline)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Color.black.opacity(0.16), radius: 1, x: 0, y: 2)
            .shadow(color: Color.black.opacity(0.08), radius: 1, x: 0, y: -0.5)
    }
}

struct InputFieldView_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        InputFieldView(placeholder: "Placeholder", text: $text)
    }
}

