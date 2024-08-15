//
//import SwiftUI
//
//struct CustomTabView: View {
//    @Binding var tabSelection: Int
//    @Binding var isProfileSelected: Bool
//    @State private var lastFirstTabState: Bool = false
//    
//    let tabBarItems: [(normal: String, filled: String)] = [
//        ("safari", "safari.fill"),
//        ("plus", "plus"),
//        ("message", "message.fill")
//    ]
//    
//    let profileImage: Image?
//    
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 24)
//                .fill(Material.ultraThinMaterial)
//                .overlay(
//                    Capsule()
//                        .fill(Color.black.opacity(0.5))
//                )
//                .frame(width: UIScreen.main.bounds.width * 0.43, height: 44)
//                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 3)
//            
//            HStack(spacing: 33) {
//                ForEach(0..<3, id: \.self) { index in
//                    Button(action: {
//                        withAnimation(.spring()) {
//                            if index == 0 {
//                                if tabSelection == 1 {
//                                    isProfileSelected.toggle()
//                                } else {
//                                    isProfileSelected = lastFirstTabState
//                                }
//                            } else {
//                                lastFirstTabState = isProfileSelected
//                            }
//                            tabSelection = index + 1
//                        }
//                    }) {
//                        ZStack {
//                            if index == 0 {
//                                if isProfileSelected && (tabSelection == 1 || lastFirstTabState) {
//                                    profileImage?
//                                        .resizable()
//                                        .scaledToFit()
//                                        .clipShape(Circle())
//                                        .frame(width: 32, height: 32)
//                                } else {
//                                    Image(systemName: getIconName(for: index))
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 32, height: 32)
//                                        .foregroundStyle(.white)
//                                }
//                            } else {
//                                Image(systemName: getIconName(for: index))
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 32, height: 32)
//                                    .foregroundStyle(.white)
//                            }
//                        }
//                    }
//                    .frame(height: 32)
//                }
//            }
//            .frame(height: 48)
//        }
//    }
//    
//    private func getIconName(for index: Int) -> String {
//        if index == 0 && isProfileSelected && tabSelection == 1 {
//            return tabBarItems[index].filled
//        }
//        return tabSelection == index + 1 ? tabBarItems[index].filled : tabBarItems[index].normal
//    }
//}
//
//struct CustomTabView_Previews: PreviewProvider {
//    @State static var isProfileSelected = false
//    
//    static var previews: some View {
//        CustomTabView(tabSelection: .constant(1), isProfileSelected: .constant(false), profileImage: Image(systemName: "ej"))
//    }
//}



import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Binding var isProfileView: Bool
    
    let tabBarItems: [(normal: String, filled: String)] = [
        ("safari", "safari.fill"),
        ("plus", "plus"),
        ("message", "message.fill")
    ]
    
    let profileImage: Image?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Material.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .fill(Color.black.opacity(0.5))
                )
                .frame(width: UIScreen.main.bounds.width * 0.43, height: 44)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 3)
            
            HStack(spacing: 33) {
                ForEach(0..<3, id: \.self) { index in
                    Button(action: {
                        if index == 0 && tabSelection == 1 {
                            withAnimation(.spring()) {
                                isProfileView.toggle()
                            }
                        } else {
                            withAnimation(.spring()) {
                                tabSelection = index + 1
                            }
                        }
                    }) {
                        ZStack {
                            if index == 0 && isProfileView {
                                profileImage?
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 32, height: 32)
                            } else {
                                Image(systemName: getIconName(for: index))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .frame(height: 32)
                }
            }
            .frame(height: 48)
        }
    }
    
    private func getIconName(for index: Int) -> String {
        if index == 0 && !isProfileView {
            return tabSelection == 1 ? tabBarItems[index].filled : tabBarItems[index].normal
        }
        return tabSelection == index + 1 ? tabBarItems[index].filled : tabBarItems[index].normal
    }
}
