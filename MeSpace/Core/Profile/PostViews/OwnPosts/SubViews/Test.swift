//
//  Test.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/30/24.
//

import SwiftUI

struct Test: View {
    @State private var show = false
    @Namespace var namespace
    
    
    var body: some View {
        ZStack {
            if !show {
                VStack {
                    Spacer()
                    Image("profileheaderimage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "shape", in: namespace)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 500)
                        .clipped()
                    Spacer()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    
                    Image("profileheaderimage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "shape", in: namespace)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 500)
                        .clipped()
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                show.toggle()
            }
        }
    }
}

#Preview {
    Test()
}
