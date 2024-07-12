import SwiftUI

struct RegistrationHeaderView: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Create Account").font(.title2).fontWeight(.bold)
                Text("Discover content and customize your own space here at MeSpace")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.black.opacity(0.7))
            }
            
            Spacer()
            
            VStack {
                Image("mespace_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            }
        }
        .padding(.top, 16)
        .padding(.bottom, 24)
    }
}


struct RegistrationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationHeaderView()
    }
}


