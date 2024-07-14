
import SwiftUI

struct CustomSpaceView: View {
    
    @Binding var showProfileName: Bool
    var body: some View {
        VStack(spacing: 0) {
            CustomSpaceHeader(showProfileName: $showProfileName)
            
            VStack {
                Text("Hello")
                Text("Customize your Profile Layout!")
                
                Spacer()
            }
            .font(.body)
            .padding(.top, 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.white))
        }
        .ignoresSafeArea()
    }
}

struct CustomSpaceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSpaceView(showProfileName: .constant(false))
    }
}
