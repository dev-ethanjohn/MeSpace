import SwiftUI

import SwiftUI

struct ProfileHeader: View {
    @Binding var isBottomSheetVisible: Bool
    @Binding var offset: CGFloat
    @Binding var lastDragValue: CGFloat
    let geometry: GeometryProxy
    let progress: CGFloat
    @Binding var isHeaderTextVisible: Bool
    
    @State private var isLightMode: Bool = true
    @State private var isPressed: Bool = false //toggle transition (for button left)
    
    @State private var isMenuPresented: Bool = false
    
    var body: some View {
        VStack  {
            HStack(spacing: 20) {
                
                ZStack {
                    if isBottomSheetVisible {
                        Image(systemName: "pencil")
                            .transition(.opacity.combined(with: .scale))
                    } else {
                        Image(systemName: "chevron.left")
                            .transition(.opacity.combined(with: .scale))
                    }
                }
                .padding()
                .fontWeight(isPressed ? .bold : .regular)
                .foregroundStyle(isPressed ? .yellow : .white)
                .frame(width: 40, height: 40)
                .background(Color(.black))
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .scaleEffect(isPressed ? 1.1 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in
                            isPressed = true
                        }
                        .onEnded { _ in
                            isPressed = false
                            withAnimation(.smooth(duration: 0.3)) {
                                isBottomSheetVisible.toggle()
                                if isBottomSheetVisible {
                                    isHeaderTextVisible = false
                                    offset = 0
                                    lastDragValue = 0
                                } else {
                                    isHeaderTextVisible = true
                                    offset = geometry.frame(in: .global).height * 0.9
                                    lastDragValue = geometry.frame(in: .global).height * 0.9
                                }
                            }
                        }
                )
                
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 28)
                        .fill(isLightMode ? Color.black.opacity(0.6) : Color.white.opacity(0.6))
                        .frame(height: 32)
                        .overlay {
                            Rectangle()
                                .fill(Material.ultraThin)
                                .opacity(0.3)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .opacity(isHeaderTextVisible || !isBottomSheetVisible ? 1 : 0)
                        .offset(y: isHeaderTextVisible || !isBottomSheetVisible ? 0 : 20)
                        .animation(.easeInOut(duration: 0.3), value: isHeaderTextVisible || !isBottomSheetVisible)
                    
                    
                    
                    Text("Ethan John Paguntalan 💻")
                        .font(.subheadline)
                        .foregroundColor(isLightMode ? .white : .black)
                        .fontWeight(.semibold)
                        .opacity(isHeaderTextVisible || !isBottomSheetVisible ? 1 : 0)
                        .offset(y: isHeaderTextVisible || !isBottomSheetVisible ? 0 : 20)
                        .animation(.easeInOut(duration: 0.3), value: isHeaderTextVisible || !isBottomSheetVisible)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isLightMode.toggle()
                            }
                        }
                }
                .frame(maxWidth: UIScreen.main.bounds.size.width * 1.0)
                
                Button(action: {
                    // Add action for menu button
                    isMenuPresented = true
                }) {
                    Image(systemName: "line.3.horizontal")
                        .padding()
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(Color(.black))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                }
                .sheet(isPresented: $isMenuPresented) {
                    MenuView()
                }
                
            }
            .padding(.horizontal)
        }
        //        .background(.gray)
        .frame(height: 20)
        .padding(.bottom, 24)
        .padding(.top)
    }
}

struct TestCanvasHeader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ProfileHeader(
                isBottomSheetVisible: .constant(true),
                offset: .constant(0),
                lastDragValue: .constant(0),
                geometry: geometry,
                progress: 0.5,
                isHeaderTextVisible: .constant(true)
            )
        }
    }
}

struct MenuView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Account")) {
                    Button("Profile Settings") { }
                    Button("Notifications") { }
                    Button("Privacy") { }
                }
                
                Section(header: Text("Support")) {
                    Button("Help Center") { }
                    Button("Report a Problem") { }
                }
                
                Section {
                    Button("Log Out", role: .destructive) { }
                }
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}
