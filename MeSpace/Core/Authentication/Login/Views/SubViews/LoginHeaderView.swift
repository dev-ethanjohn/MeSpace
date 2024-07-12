//
//  LoginHeaderView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/12/24.
//

import SwiftUI

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("MeSpace")
                .font(.largeTitle)
            
            Text("Be your space..")
                .font(.system(size: 24))
                .foregroundStyle(Color(.black).opacity(0.6))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 40)
        .fontWeight(.bold)
    }
}

#Preview {
    LoginHeaderView()
}

