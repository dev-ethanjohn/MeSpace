//
import SwiftUI

struct BottomSheetDragGestureModifier: ViewModifier {
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
    func bottomSheetDragGesture(offset: Binding<CGFloat>, lastDragValue: Binding<CGFloat>, reader: GeometryProxy) -> some View {
        self.modifier(BottomSheetDragGestureModifier(offset: offset, lastDragValue: lastDragValue, reader: reader))
    }
}
