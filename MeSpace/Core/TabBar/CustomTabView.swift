//
//  CustomTabView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/12/24.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var tabSelection: Int
    @Binding var isProfileSelected: Bool  //State to manage profile toggle
    
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
                .frame(width: UIScreen.main.bounds.width * 0.48, height: 48)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 3)
            
            HStack(spacing: 36) {
                ForEach(0..<3, id: \.self) { index in
                    Button(action: {
                        withAnimation(.snappy(duration: 0.1)) {
                            if index == 0 {
                                isProfileSelected.toggle()
                            } else {
                                isProfileSelected = false
                            }
                            tabSelection = index + 1
                        }
                    }) {
                        ZStack {
                            //Display profile / explore icon based on selection state
                            if index == 0 && tabSelection == 1 {
                                if isProfileSelected {
                                    profileImage?
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .frame(width: 32, height: 32)
                                      
                                } else {
                                    Image(systemName: tabBarItems[index].filled)
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(.white)
                                }
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
    
    //A helper func to get the relevant icon name on a given selection state
    private func getIconName(for index: Int) -> String {
        if index == 0 && isProfileSelected && tabSelection == 1 {
            return tabBarItems[index].filled
        }
        return tabSelection == index + 1 ? tabBarItems[index].filled : tabBarItems[index].normal
    }
}

struct CustomTabView_Previews: PreviewProvider {
    @State static var isProfileSelected = false

    static var previews: some View {
        CustomTabView(tabSelection: .constant(1), isProfileSelected: $isProfileSelected, profileImage: Image("profile"))
    }
}