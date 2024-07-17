import SwiftUI

struct ProfileHeader: View {
    @Binding var isBottomSheetVisible: Bool
    @Binding var offset: CGFloat
    @Binding var lastDragValue: CGFloat
    let geometry: GeometryProxy
    let progress: CGFloat
    @Binding var isHeaderTextVisible: Bool
    
    var body: some View {
        VStack  {
            HStack(spacing: 20) {
                Button(action: {
                    withAnimation(.easeInOut) {
                        isBottomSheetVisible.toggle()
                        if isBottomSheetVisible {
                            isHeaderTextVisible = false
                            offset = 0
                            lastDragValue = 0
                        } else {
                            isHeaderTextVisible = true
                            offset = geometry.frame(in: .global).height * 0.8
                            lastDragValue = geometry.frame(in: .global).height * 0.8
                        }
                    }
                }) {
                    Image(systemName: isBottomSheetVisible ? "pencil" : "chevron.left")
                        .padding()
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(Color(.black))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                }
                
                Text("Ethan John Paguntalan 💻")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .frame(maxWidth: UIScreen.main.bounds.size.width * 1.0)
                    .opacity(isHeaderTextVisible ? 1 : 0)
                    .offset(y: isHeaderTextVisible ? 0 : 20)
                    .animation(.easeInOut(duration: 0.3), value: isHeaderTextVisible)
                
                Button(action: {
                    // Add action for menu button
                }) {
                    Image(systemName: "line.3.horizontal")
                        .padding()
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(Color(.black))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                }
            }
            .padding(.horizontal)
        }
//        .background(.gray)
        .frame(height: 20)
        .padding(.bottom, 24)
        .padding(.top)
    }
}

struct TestCanvasHeader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ProfileHeader(
                isBottomSheetVisible: .constant(true),
                offset: .constant(0),
                lastDragValue: .constant(0),
                geometry: geometry,
                progress: 0.5,
                isHeaderTextVisible: .constant(true)
            )
        }
    }
}
