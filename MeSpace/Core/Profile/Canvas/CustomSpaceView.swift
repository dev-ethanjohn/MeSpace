
import SwiftUI

struct CustomSpaceView: View {
    
    @Binding var showProfileName: Bool
    @Binding var isBottomSheetVisible: Bool

    var body: some View {
        ZStack(alignment: .top) {
            
            VStack {
                CustomSpaceHeader(
                    showProfileName: $showProfileName,
                    isBottomSheetVisible: $isBottomSheetVisible
                )
                
                Text("Hello")
                Spacer()
            }
            .font(.body)
//            .padding(.top, 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.yellow))
        }
        .ignoresSafeArea()
    }
}

struct CustomSpaceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSpaceView(showProfileName: .constant(false), isBottomSheetVisible: .constant(false))
    }
}
