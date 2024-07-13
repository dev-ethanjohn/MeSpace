//
//  CustomSpaceView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/13/24.
//

import SwiftUI

struct CustomSpaceView: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomSpaceHeader()
            
            
            // Add a spacer to push the content below the header
            //            Spacer()
            
            // Add your canvas content here
            
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

#Preview {
    CustomSpaceView()
}

struct CustomSpaceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSpaceView()
    }
}
