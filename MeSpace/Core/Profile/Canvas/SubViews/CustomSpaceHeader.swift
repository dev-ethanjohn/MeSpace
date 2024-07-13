//
//  CustomSpaceHeader.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/13/24.
//

import SwiftUI


struct CustomSpaceHeader: View {
    
    @State private var showMeLoginView = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Add your action here
                }, label: {
                    Image(systemName: "pencil")
                        .padding()
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                })
                
                Spacer()
                
                Button(action: {
                    showMeLoginView = true
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .padding()
                        .frame(width: 40, height: 40)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                })
            }
            .padding()
            .tint(.black)
        }
        .frame(height: 20)
        .padding(.bottom, 20)
        .padding(.top, getSafeAreaTopPadding())
        .background(Color(.white))
        .fullScreenCover(isPresented: $showMeLoginView) {
            NavigationStack {
                LoginView(email: "", password: "")
            }
        }
    }
    
    // Function to get the top safe area padding
    private func getSafeAreaTopPadding() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.safeAreaInsets.top ?? 0
    }
}

struct CanvasHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSpaceHeader()
    }
}
