//
//  BottomSheetDragGestureModifier.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/13/24.
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
            let maxOffset = -reader.frame(in: .global).height + 540
            if value.translation.height + lastDragValue > 0 {
                offset = (value.translation.height + lastDragValue) / 4
            } else if value.translation.height + lastDragValue < maxOffset {
                offset = maxOffset
            } else {
                offset = value.translation.height + lastDragValue
            }
        }
    }
    
    private func handleDragEnd(_ value: DragGesture.Value) {
        withAnimation(.spring()) {
            let maxOffset = -reader.frame(in: .global).height + 540
            if value.translation.height + lastDragValue > 0 {
                offset = 0
            } else if value.translation.height + lastDragValue < maxOffset {
                offset = maxOffset
            } else {
                offset = value.translation.height + lastDragValue
            }
            lastDragValue = offset
        }
    }
}

extension View {
    func bottomSheetDragGesture(offset: Binding<CGFloat>, lastDragValue: Binding<CGFloat>, reader: GeometryProxy) -> some View {
        self.modifier(BottomSheetDragGestureModifier(offset: offset, lastDragValue: lastDragValue, reader: reader))
    }
}

// Preview for the modifier
struct BottomSheetDragGestureModifier_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            Color.blue
                .frame(width: 300, height: 500)
                .modifier(BottomSheetDragGestureModifier(offset: .constant(0), lastDragValue: .constant(1), reader: geometry))
        }
    }
}
