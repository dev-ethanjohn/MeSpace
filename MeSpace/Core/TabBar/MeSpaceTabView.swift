//
//  MeSpaceTabView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/12/24.
//



import SwiftUI


struct MeSpaceTabView: View {
    @State private var selectedTab = 1
    @State private var isProfileSelected = true
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selectedTab) {
                ExploreView()
                    .tag(1)
                    .onTapGesture {
                        if selectedTab == 1 {
                            withAnimation(.linear) {
                                isProfileSelected.toggle()
                            }
                        }
                    }
                
                Text("Create")
                    .tag(2)
                
                Text("Message")
                    .tag(3)
            }
            .ignoresSafeArea(edges: .all)
            .background(Color(.white))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack {
                Spacer()

                CustomTabView(tabSelection: $selectedTab, isProfileSelected: $isProfileSelected, profileImage: Image("mespace_logo"))
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(maxWidth: .infinity)
                
            }
            .zIndex(1)
            
            if isProfileSelected {
                ProfileView()
            }
        }
    }
}

// Example views for Explore and Profile
struct ExploreView: View {
    var body: some View {
        Text("Explore")
    }
}


struct MeSpaceTabView_Previews: PreviewProvider {
    static var previews: some View {
        MeSpaceTabView()
    }
}






