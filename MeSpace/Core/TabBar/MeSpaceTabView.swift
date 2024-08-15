import SwiftUI

struct MeSpaceTabView: View {
    @State private var selectedTab = 1
    @State private var isProfileView = true
    @State private var isBottomSheetVisible = true
    @State private var isTabBarVisible = true
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                ZStack {
                    ExploreView(isTabBarVisible: $isTabBarVisible)
                    
                    if isProfileView {
                        ProfileView(isBottomSheetVisible: $isBottomSheetVisible, isTabBarVisible: $isTabBarVisible)
                            .transition(.move(edge: .bottom))
                    }
                }
                .tag(1)
                
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
                if isTabBarVisible {
                    CustomTabView(tabSelection: $selectedTab, isProfileView: $isProfileView, profileImage: Image("ej"))
                        .edgesIgnoringSafeArea(.bottom)
                        .frame(maxWidth: .infinity)
                        .offset(y: isBottomSheetVisible ? 0 : UIScreen.main.bounds.height)
                        .offset(y: isTabBarVisible ? 0 : UIScreen.main.bounds.height)
                        .animation(.spring(), value: isBottomSheetVisible)
                }
            }
            .animation(.spring(), value: isTabBarVisible)
            .zIndex(1)
        }
    }
}

struct MeSpaceTabView_Previews: PreviewProvider {
    static var previews: some View {
        MeSpaceTabView()
    }
}
