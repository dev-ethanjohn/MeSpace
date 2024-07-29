//
//  PostHeaderView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/29/24.
//

import SwiftUI



struct PostHeaderView: View {
    var body: some View {
        ZStack {
            BlurViewContent(style: .light)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    HStack(spacing: 12) {
                        Text("love story")
                            .foregroundStyle(.white)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(.pink)
                            .clipShape(Capsule())
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.pink, lineWidth: 1)
                            }
                        
                        HStack {
                            Text("mood:")
                                .fontWeight(.semibold)
                            Text("in love ❤️")
                        }
                        .font(.footnote)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(.white)
                        .clipShape(Capsule())
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 1)
                        }
                        
                        HStack {
                            Text("🎧:")
                                .fontWeight(.semibold)
                            Text("crush")
                                .fontWeight(.semibold)
                        }
                            .font(.footnote)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(.white)
                            .clipShape(Capsule())
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.black, lineWidth: 1)
                            }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
                .background(.clear)
                
            }
            
        }
        .frame(maxWidth: .infinity)
               .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}


#Preview {
    PostHeaderView()
}


struct BlurViewContent: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

#Preview {
    PostHeaderView()
}
