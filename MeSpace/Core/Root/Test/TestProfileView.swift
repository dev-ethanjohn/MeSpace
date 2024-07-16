
import SwiftUI

struct TestProfileView: View {
    @State private var offset: CGFloat = 0
    @State private var lastDragValue: CGFloat = 0
    @Binding var isBottomSheetVisible: Bool
    @State private var isHeaderTextVisible: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let progress = calculateProgress(geometry: geometry)
            let screenHeight = geometry.size.height
            let bottomSheetHeight = screenHeight * 1
            
            ZStack(alignment: .top) {
                TestCanvasHeader(isBottomSheetVisible: $isBottomSheetVisible,
                                 offset: $offset,
                                 lastDragValue: $lastDragValue,
                                 geometry: geometry,
                                 progress: progress,
                                 isHeaderTextVisible: $isHeaderTextVisible)
                    .zIndex(1)
                
                TestCanvasView()
                
                ZStack(alignment: .bottom) {
                    TestBottomSheet(progress: progress, maxOffset: screenHeight * 0.325)
                        .shadow(color: Color.black.opacity(0.16), radius: 4, x: 0, y: -4)
                        .frame(height: bottomSheetHeight)
                        .offset(y: calculateBottomSheetOffset(screenHeight: screenHeight, bottomSheetHeight: bottomSheetHeight))
                        .testbottomSheetDragGesture(offset: $offset, lastDragValue: $lastDragValue, reader: geometry)
                        .animation(.spring(), value: isBottomSheetVisible)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .onChange(of: progress) { _, newProgress in
                if newProgress >= 0.99 && isBottomSheetVisible {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isHeaderTextVisible = true
                    }
                } else if isBottomSheetVisible {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isHeaderTextVisible = false
                    }
                }
            }
            .onChange(of: isBottomSheetVisible) { _, newValue in
                if !newValue {
                    // Bottom sheet is moving out
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isHeaderTextVisible = true
                    }
                }
            }
        }
    }
    
    private func calculateProgress(geometry: GeometryProxy) -> CGFloat {
        let maxOffset = geometry.size.height * 0.325
        return min(1, max(0, offset / maxOffset))
    }
    
    private func calculateBottomSheetOffset(screenHeight: CGFloat, bottomSheetHeight: CGFloat) -> CGFloat {
        if isBottomSheetVisible {
            return screenHeight * 0.4 - offset
        } else {
            return screenHeight + 40
        }
    }
}

struct TestCanvasView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(.white)
                    .ignoresSafeArea()
                
                ZStack {
                    Text("Hello")
                }
                .padding(.vertical, 60)
            }
        }
    }
}


struct TestCanvasHeader: View {
    @Binding var isBottomSheetVisible: Bool
    @Binding var offset: CGFloat
    @Binding var lastDragValue: CGFloat
    let geometry: GeometryProxy
    
    let progress: CGFloat
    @Binding var isHeaderTextVisible: Bool
    
    var body: some View {
        VStack  {
            HStack(spacing: 20) {
                Button(action: {
                    withAnimation(.easeInOut) {
                        isBottomSheetVisible.toggle()
                        if isBottomSheetVisible {
                            // Bottom sheet becoming visible (pencil tapped)
                            isHeaderTextVisible = false
                            offset = 0
                            lastDragValue = 0
                        } else {
                            // Bottom sheet moving out (chevron tapped)
                            isHeaderTextVisible = true
                            offset = geometry.frame(in: .global).height * 0.8
                            lastDragValue = geometry.frame(in: .global).height * 0.8
                        }
                    }
                }) {
                    Image(systemName: isBottomSheetVisible ? "pencil" : "chevron.left")
                        .padding()
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(Color(.black))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                }
                
                Text("Ethan John Paguntalan 💻")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .frame(maxWidth: UIScreen.main.bounds.size.width * 1.0)
                    .opacity(isHeaderTextVisible ? 1 : 0)
                    .offset(y: isHeaderTextVisible ? 0 : 20)
                    .animation(.easeInOut(duration: 0.3), value: isHeaderTextVisible)
                
                Button(action: {
                    // Add action for menu button
                }) {
                    Image(systemName: "line.3.horizontal")
                        .padding()
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(Color(.black))
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 20)
        .padding(.bottom, 24)
        .padding(.top)
    }
}

struct TestBottomSheet: View {
    @State private var selectedFilter: TabBarContentFilter = .posts
    @Namespace var animation
    let progress: CGFloat
    let maxOffset: CGFloat
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(spacing: 0) {
                ZStack {
                    GeometryReader { imageGeometry in
                        Image("profileheaderpic")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: imageGeometry.size.width * 1.06)
                            .blur(radius: 4)
                            .overlay(Color.black.opacity(0.6))
                            .mask(Rectangle().frame(width: imageGeometry.size.width, height: 140))
                            .frame(width: imageGeometry.size.width, height: 140)
                            .clipped()
                    }
                    
                    TestProfileHeaderView()
                }
                .frame(height: 140)
                .offset(y: progress >= 0.99 ? -140 : 0)
                
                TestBottomSheetTabBarView(selectedFilter: $selectedFilter, animation: animation, progress: progress)
                    .offset(y: progress >= 0.99 ? -140 : 0)
            }
            
            Capsule()
                .fill(progress >= 0.99 ? Color.black.opacity(0.4) : Color.white.opacity(0.4))
                .frame(width: 32, height: 4)
                .padding(.top, 8)
                .zIndex(1)
        }
        .frame(maxHeight: UIScreen.main.bounds.size.height * 0.9, alignment: .top)
        .frame(maxWidth: .infinity)
        .background(Color(.white))
        .cornerRadius(32)
    }
}

struct TestProfileHeaderView: View {
    var body: some View {
        ZStack(alignment: .top) {
            TestMainProfileHeaderInfoView()
        }
        .frame(maxHeight: 140)
    }
}

struct TestMainProfileHeaderInfoView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack(spacing: 20) {
                Image("ej")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                Button(action: {
                    print("Enter Edit Mode")
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 12, weight: .semibold))
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .foregroundStyle(.white)
                        .overlay(
                            Capsule()
                                .stroke(Color.white, lineWidth: 0.5)
                        )
                }
            }
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Ethan John Paguntalan 💻")
                            .lineLimit(3)
                            .minimumScaleFactor(0.75)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    
                    Text("@only_ej")
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemGray3))
                        .font(.footnote)
                    
                    Spacer()
                    
                    HStack {
                        FollowerDataView(count: "6,509", label: "following")
                        Spacer()
                        FollowerDataView(count: "2,098", label: "followers")
                        Spacer()
                        FollowerDataView(count: "12", label: "moots")
                        Spacer().frame(width: 80)
                    }
                    .foregroundStyle(.white)
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
    }
}

struct TestBottomSheetTabBarView: View {
    @Binding var selectedFilter: TabBarContentFilter
    var animation: Namespace.ID
    let progress: CGFloat
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabBarContentFilter.allCases, id: \.self) { filter in
                TestTabBarItemView(filter: filter, selectedFilter: $selectedFilter, animation: animation)
            }
        }
        .padding(.top, progress >= 0.99 ? 10 : 0)
        .frame(height: progress >= 0.99 ? 52 : 44)
        .background(Color.white)
    }
}

struct TestTabBarItemView: View {
    let filter: TabBarContentFilter
    @Binding var selectedFilter: TabBarContentFilter
    var animation: Namespace.ID
    
    var body: some View {
        VStack(spacing: 0) {
            Text(filter.title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(selectedFilter == filter ? .black : .gray)
                .padding(.vertical, 8)
                .matchedGeometryEffect(id: "text_\(filter)", in: animation)
            
            ZStack {
                if selectedFilter == filter {
                    Rectangle()
                        .foregroundStyle(.black)
                        .frame(width: 160, height: 1)
                        .matchedGeometryEffect(id: "underline", in: animation)
                } else {
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(width: 160, height: 1)
                }
            }
            .frame(height: 1)
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedFilter = filter
            }
        }
    }
}

struct TestBottomSheetDragGestureModifier: ViewModifier {
    @Binding var offset: CGFloat
    @Binding var lastDragValue: CGFloat
    let reader: GeometryProxy
    
    func body(content: Content) -> some View {
        content.gesture(
            DragGesture()
                .onChanged { handleDragChange($0) }
                .onEnded { handleDragEnd($0) }
        )
    }
    
    private func handleDragChange(_ value: DragGesture.Value) {
        withAnimation(.spring()) {
            let maxOffset = reader.frame(in: .global).height * 0.325
            let minOffset = -reader.frame(in: .global).height * 0.05
            
            offset = min(maxOffset, max(minOffset, -value.translation.height + lastDragValue))
        }
    }
    
    private func handleDragEnd(_ value: DragGesture.Value) {
        withAnimation(.spring()) {
            let maxOffset = reader.frame(in: .global).height * 0.325
            let minOffset = 0.0
            
            offset = min(maxOffset, max(minOffset, -value.translation.height + lastDragValue))
            lastDragValue = offset
        }
    }
}

extension View {
    func testbottomSheetDragGesture(offset: Binding<CGFloat>, lastDragValue: Binding<CGFloat>, reader: GeometryProxy) -> some View {
        self.modifier(TestBottomSheetDragGestureModifier(offset: offset, lastDragValue: lastDragValue, reader: reader))
    }
}

struct TestProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TestProfileView(isBottomSheetVisible: .constant(true))
    }
}
