import SwiftUI

struct SpaceCanvasView: View {
    @State private var isSheetPresented = false
    let defaultSheetHeight: CGFloat = 0.1 // 90% of screen height
    let sheetCornerRadius: CGFloat = 24
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("711")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width * 1.0, maxHeight: UIScreen.main.bounds.height * 1.0)
                .ignoresSafeArea()
            
            VStack {
                SpaceContainer()
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            }
            .shadow(color: Color.black.opacity(0.6), radius: 4, x: 0, y: 8)
            .padding(.top, UIScreen.main.bounds.size.height * 0.05)
            .padding()
            
            VStack {
                Spacer()
                Button("Show Comment Wall") {
                    isSheetPresented = true
                }
                .padding()
                
                Button {
                    isSheetPresented = true
                } label: {
                    Image(systemName: "")
                }

                
                Spacer()
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            VStack(alignment: .leading) {
                CommentWallSheet()
                    .presentationDetents([
                        .height(UIScreen.main.bounds.height * defaultSheetHeight),
                        .medium,
                        .large
                    ])
                    .presentationDragIndicator(.visible)
                //                .interactiveDismissDisabled()
                    .presentationCornerRadius(sheetCornerRadius)
                    .presentationBackground(Material.thick)
            }
        }
    }
}

struct CommentWallSheet: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack(spacing: 0) {
            // Sticky header
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Comment Wall")
                        .font(.headline)
                    
                    Spacer ()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .foregroundStyle(.black)
                .fontWeight(.bold)
                
                Divider()
            }
            .frame(height: 46)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Scrollable content
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(0..<20) { index in
                        Text("This is comment \(index + 1). Allow replies ")
                            .padding(12)
                            .background(Color.yellow)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
