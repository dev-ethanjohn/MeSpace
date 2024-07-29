//
//  OwnPostDetailedView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/29/24.
//




import SwiftUI
import UIKit

struct OwnPostDetailedView: View {
    let post: Post
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
//        NavigationStack {
            ZStack (alignment: .bottom)  {
                ScrollView {
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        Section {
                            if let uiImage = UIImage(named: post.imageURL) {
                                GeometryReader { geometry in
                                    let screenWidth = geometry.size.width
                                    let aspectRatio = uiImage.size.height / uiImage.size.width
                                    let imageHeight = min(screenWidth * aspectRatio, 900) // Ensure the height doesn't exceed 600
                                    
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: screenWidth, height: imageHeight)
                                        .clipped()
                                }
                                //Aspect ratio
                                .frame(height: min(UIImage(named: post.imageURL)!.size.height / UIImage(named: post.imageURL)!.size.width * UIScreen.main.bounds.width, 900))
                            } else {
                                // If image still loads
                                Color.gray
                                    .frame(height: 200)
                            }
                            PostDescriptionView()
                        } header: {
                            PostHeaderView()
                        }
                        
                        //MARK: COMMENTS
                        PostCommentsView()
                    }
                    .padding(0)
                }
                .background(Color(.systemGray) .opacity(0.1))
                .scrollIndicators(.hidden)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack(spacing: 8) {
                            Button(action: {
                          
                                dismiss()
                            }) {
                                Image(systemName: "chevron.backward")
                                    .fontWeight(.medium)
                            }
                            
                            HStack(spacing: 12) {
                                Image("ej")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 28, height: 28)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: -2) {
                                    Text("Hoshi Taiwan ☘️")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                    Text("@hoshi_tw")
                                        .font(.footnote)
                                        .foregroundStyle(Color(.darkGray))
                                }
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 0) {
                            Button(action: {
                                // Action for follow button
                            }) {
                                Text("Follow")
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 12)
                                    .fontWeight(.bold)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                            
                            Button(action: {
                                // Action for search button
                            }) {
                                Image(systemName: "magnifyingglass")
                                    .fontWeight(.medium)
                            }
                        }
                    }
                }
                .toolbarBackground(Color.white, for: .navigationBar) // Set navigation bar background
                .toolbarBackground(.visible, for: .navigationBar) // Ensure visibility
                .tint(.black)
                .ignoresSafeArea(.container, edges: .bottom)
                
                
                VStack {
                    HStack {
                        TextField("Add comment", text: .constant(""))
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .foregroundStyle(Color(.black))
                            
                            .font(.subheadline)
//                            .padding(.top, 0)
                            .padding(.horizontal, 16)
                            .frame(minHeight: 36)
                            .background(Color(.systemGray5).opacity(0.7))
                            .clipShape(.capsule)
                        
                        Button(action: {
                            // Like action
                        }) {
                            Image(systemName: "heart")
                                .font(.title2)
                                .padding(.leading, 10)
                        }
                        
                        Button(action: {
                            // Share action
                        }) {
                            Image(systemName: "paperplane")
                                .font(.title2)
                                .padding(.leading, 10)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
                }
                .tint(.black)
                .frame(maxHeight: UIScreen.main.bounds.height * 0.06)
                .padding(.bottom, 0)
                .padding(.horizontal)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.08), radius: 3, x: 0, y: -1)
                .ignoresSafeArea(edges: .bottom) // Ensures the bottom sheet ignores safe area
                
            }
//            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
//        }
    }
}

//struct ExploreUserPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            OwnPostDetailedView(imageName: "nightbridge") // Replace with your actual image asset name
//        }
//    }
//}

