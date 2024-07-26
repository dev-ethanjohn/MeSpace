////
////  SpaceContainer.swift
////  MeSpace
////
////  Created by Ethan John Paguntalan on 7/17/24.
////
//
//import SwiftUI
//
//struct SpaceContainer: View {
//    
//    let images = ["ghibli1", "ghibli2", "ghibli3"]
//    
//    var body: some View {
//        
//        VStack(spacing: 0) {
//            
//            VStack(alignment: .leading, spacing: 0) {
//                //MARK: 1
//                HStack {
//                    Text("ejatmespace.com")
//                        .foregroundStyle(Color(.white))
//                        .fontWeight(.bold)
//                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
//                    
//                    
//                    Spacer()
//                    
//                    Image(systemName: "house.fill")
//                        .foregroundStyle(.white)
//                }
//                .padding(.horizontal, 12)
//                .frame(maxWidth: .infinity)
//                .frame(height: 40)
//                .background(Color(hex: 0x2AB7B7))
//                
//                
//                
//                
//                //MARK: 2
//                HStack(alignment: .top, spacing: 0) {
//                    VStack {
//                        Text("EJ :D")
//                            .fontWeight(.black)
//                            .font(.system(size: 24))
//                            .foregroundStyle(.black)
////                        Group {
//                            Text("WELCOME")
//                                .font(.caption)
//                                .foregroundStyle(.blue)
//                                .fontWeight(.semibold)
//                            +
//                            Text(" all in here 🙌🏼")
//                                .font(.footnote)
////                        }
//                        .lineSpacing(-6)
//                        .multilineTextAlignment(.center) // Aligns the text to the center
//                        
//                        
//                        Image("profileheaderpic")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 140, height: 140)
//                            .clipped()
//                            .clipShape(RoundedRectangle(cornerRadius: 12))
//                        
//                        
//                    }
//                    .frame(width: UIScreen.main.bounds.width * 0.35)
//                    .padding(.vertical, 8)
//                    .padding(.horizontal, 10)
//                    
//                    
//                    VStack(spacing: 12) {
//                        HStack(alignment: .top, spacing: 4) {
//                            VStack {
//                                Group {
//                                    Text("Interests: ").fontWeight(.bold)
//                                    +
//                                    Text("arts, coding, maths, startups, design, cool stuff, anything creative")
//                                }
//                                .lineSpacing(-6)
//                                .multilineTextAlignment(.leading)
//                                .font(.footnote)
//                            }
//                            .frame(maxWidth: .infinity)
//                            .layoutPriority(1)
//                            
//                            VStack {
//                                Group {
//                                    Text("Favorites: ").fontWeight(.bold)
//                                    +
//                                    Text("chocolates, fried kang kong, micron pen, Keshi music, chill")
//                                }
//                                .lineSpacing(-6)
//                                .multilineTextAlignment(.leading)
//                                .font(.footnote)
//                            }
//                            .frame(maxWidth: .infinity)
//                            .layoutPriority(1)
//                        }
//                        
//                        //MARK:
//                        VStack(alignment: .leading, spacing: 4) {
//                            
//                            VStack(spacing: 0){
//                                Text("@only_ej's Recent Media")
//                                    .font(.footnote)
//                                    .fontWeight(.semibold)
//                                    .padding(.vertical, 4)
//                                    .frame(maxWidth: .infinity)
//                                    .background(Color(hex: 0x6997CE).opacity(0.2))
//                                    .overlay(
//                                        Rectangle()
//                                            .stroke(Color(hex: 0x6997CE), lineWidth: 1)
//                                    )
//                            }
//                            
//                            HStack {
//                                GeometryReader { geometry in
//                                    HStack(spacing: 4) {
//                                        ForEach(0..<images.count, id: \.self) { index in
//                                            Image(images[index])
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fill)
//                                                .frame(width: geometry.size.width / CGFloat(images.count), height: 70)
//                                                .clipped()
//                                        }
//                                    }
//                                }
//                            }
//                            .padding(.trailing, 8)
//                            .frame(height: 70)
//                            
//                            Text("12 images and 3 videos")
//                                .font(.caption2)
//                        }
//                    }
//                    .padding(8)
//                    .background(Color(.black).opacity(0.08))
//                    
//                }
//                .frame(maxWidth: .infinity)
//                .background(.white)
//                
//                
//                
//                
//                //MARK: V
//                VStack(alignment: .leading){
//                    Text("About Me 😄")
//                        .background(Color(hex: 0xFF7F50).opacity(0.4))
//                        .fontWeight(.semibold)
//                    Text("Just a normal person trying to make a change. Started working on this new app 2 months ago. I hope everybody well hehe. ")
//                        .font(.subheadline)
//                        .lineSpacing(-18)
//                }
//                .padding(8)
//                .overlay {
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(Color(hex: 0x6997CE).opacity(0.6), lineWidth: 1)
//                }
//                .frame(maxWidth: .infinity)
//                
//                Spacer()
//                
//            }
//            .frame(height: 360)
//            .background(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 8))
//            .overlay(
//                RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color.black, lineWidth: 1.5)
//            )
//            .shadow(color: Color.black.opacity(0.16), radius: 2, x: 0, y: 4)
//            
//        }
//        .frame(maxWidth: .infinity, alignment: .topLeading)
//    }
//}
//
//#Preview {
//    SpaceContainer()
//}


import SwiftUI

struct SpaceContainer: View {
    
    let images = ["ghibli4", "ghibli3"]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            VStack(alignment: .leading, spacing: 0) {
                //MARK: 1
                HStack {
                    Text("ejatmespace.com")
                        .foregroundStyle(Color(.white))
                        .fontWeight(.bold)
                        .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    
                    Spacer()
                    
                    Image(systemName: "house.fill")
                        .foregroundStyle(.white)
                }
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Color(hex: 0x2AB7B7))
                
                //MARK: 2
                HStack(alignment: .top, spacing: 0) {
                    VStack {
                        Text("EJ :D")
                            .fontWeight(.black)
                            .font(.system(size: 24))
                            .foregroundStyle(.black)
                        
                        Text("WELCOME")
                            .font(.caption)
                            .foregroundStyle(.blue)
                            .fontWeight(.semibold)
                        + Text(" all in here 🙌🏼")
                            .font(.footnote)
                        
                        Image("profileheaderpic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 140)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    
                    VStack(spacing: 12) {
                        HStack(alignment: .top, spacing: 4) {
                            VStack {
                                Group {
                                    Text("Interests: ").fontWeight(.bold)
                                    +
                                    Text("arts, coding, maths, startups, design, cool stuff, anything creative")
                                }
                                .lineSpacing(-6)
                                .multilineTextAlignment(.leading)
                                .font(.footnote)
                            }
                            .frame(maxWidth: .infinity)
                            .layoutPriority(1)
                            
                            VStack {
                                Group {
                                    Text("Favorites: ").fontWeight(.bold)
                                    +
                                    Text("chocolates, fried kang kong, micron pen, Keshi music, chill")
                                }
                                .lineSpacing(-6)
                                .multilineTextAlignment(.leading)
                                .font(.footnote)
                            }
                            .frame(maxWidth: .infinity)
                            .layoutPriority(1)
                        }
                        
                        //MARK:
                        VStack(alignment: .leading, spacing: 4) {
                            VStack(spacing: 0){
                                Text("@only_ej's Recents")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 4)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: 0x6997CE).opacity(0.2))
                                    .overlay(
                                        Rectangle()
                                            .stroke(Color(hex: 0x6997CE), lineWidth: 1)
                                    )
                                
                                
                            }
                            
                            HStack {
                                GeometryReader { geometry in
                                    HStack(spacing: 8) {
                                        ForEach(0..<images.count, id: \.self) { index in
                                            Image(images[index])
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: geometry.size.width / CGFloat(images.count), height: 70)
                                                .clipped()
                                        }
                                    }
                                }
                            }
                            .padding(.trailing, 8)
                            .frame(height: 70)
                            
                            Text("(view all media)")
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .foregroundStyle(.blue)
            
                            
        
                        }
                    }
                    .padding(8)
                    .background(Color(.black).opacity(0.08))
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                
                //MARK: V
                VStack(alignment: .leading){
                    Text("About Me 😄")
                        .background(Color(hex: 0xFF7F50).opacity(0.4))
                        .fontWeight(.semibold)
                    Group {
                                         Text("Just a normal person trying to make a change. Started working on this new app 2 months ago. I hope everybody well hehe. ")
                                             .font(.subheadline)
                                         + Text("24 PH 🇵🇭")
                                             .font(.subheadline)
                                             .fontWeight(.bold)
                                     }
                                     .lineSpacing(-12)
                }
                .padding(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: 0x6997CE).opacity(0.6), lineWidth: 1)
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
            }
            .frame(height: 360)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.black, lineWidth: 1.5)
            )
            .shadow(color: Color.black.opacity(0.16), radius: 2, x: 0, y: 4)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    SpaceContainer()
}
