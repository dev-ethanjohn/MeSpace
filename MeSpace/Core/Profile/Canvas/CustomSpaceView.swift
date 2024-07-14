
import SwiftUI

struct CustomSpaceView: View {

    var body: some View {
        VStack(spacing: 0) {
            CustomSpaceHeader()
            
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
        CustomSpaceView()
    }
}
