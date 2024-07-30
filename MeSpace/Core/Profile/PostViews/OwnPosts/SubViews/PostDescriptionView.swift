//
//  PostDescriptionView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/29/24.
//

import SwiftUI

struct PostDescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            // headline
            VStack {
                HStack(spacing: 0) {
                    Text("JAN 2,2025")
                    Text("・")
                    Text("11:02 AM")
                }
                .font(.caption2)
                .foregroundStyle(Color(.darkGray))
                .frame(maxWidth: .infinity, alignment: .leading)

                Text("Saw You Sparkling in the Night Beside the Bridge Where We First Met and Fell in Love Under the City Lights 🌉 ✨")
                    .font(.headline)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // caption
                VStack() {
                    Group {
                        Text("The night was cool, the river breeze messing with my hair as I chilled by the bridge with you. The city lights gave everything a soft glow, making it the perfect spot for deep talks and sneaky glances. You, looking effortlessly cool in your jacket, leaned on the railing, just soaking it all in")
                        Text("I stood nearby, eyes drifting across the water. I didn’t need to say much; with you, silence was easy. We’ve been tight forever, and nights like this were our jam. It felt like time slowed down just for us, giving us space to relax and vibe.")
                        Text("The city buzzed in the background, but we had our own little peace bubble. You caught my eye, and we shared a smile. This is what we live for—nights full of endless possibilities and an unbreakable connection. The bridge isn’t just a spot; it’s part of our story, written with every quiet laugh and shared silence.") +
                        Text(" #Hello")
                            .foregroundColor(.blue) +
                        Text(" #CityGlowNights")
                            .foregroundColor(.blue) +
                        Text(" #ImInLoveWithYou")
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical, 4)
                    
                    //MARK: TEST
                }
                .font(.subheadline)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
            }
      
            Divider()
            
            // interaction
            HStack {
                HStack(spacing: 24) {
                    HStack(spacing: 2){
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                        
                        Text("1,092")
                    }
                    HStack(spacing: 2){
                        Image(systemName: "message")
                        Text("45")
                    }
                    HStack(spacing: 2){
                        Image(systemName: "paperplane")
                        Text("7")
                    }
                  
                }
//                .font(.subheadline)
               
                
                Spacer()
                
                Image(systemName: "shippingbox")
            }
            .font(.subheadline)
            .foregroundStyle(Color(.darkGray))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            
            
        }
        .padding(.horizontal, 12)
        .padding(.top, 16)
        .padding(.bottom, 8)
        .background(.white)
        .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 32, bottomTrailingRadius: 32, topTrailingRadius: 0, style: .continuous))
        .shadow(color: Color.black.opacity(0.08), radius: 2, x: 0, y: 3)
    }
}

#Preview {
    PostDescriptionView()
}
