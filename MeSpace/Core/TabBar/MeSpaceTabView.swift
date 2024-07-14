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
                            withAnimation(.smooth) {
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
                
                CustomTabView(tabSelection: $selectedTab, isProfileSelected: $isProfileSelected, profileImage: Image("ej"))
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(maxWidth: .infinity)
            }
            .zIndex(1)
            
            if isProfileSelected {
                ProfileView()
                    .transition(.move(edge: .bottom))
                    .zIndex(0)
            }
        }
    }
}

struct MeSpaceTabView_Previews: PreviewProvider {
    static var previews: some View {
        MeSpaceTabView()
    }
}






