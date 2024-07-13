//
//  BottomSheetTabBarView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/13/24.
//

//
//  TabBarView.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/11/24.
//

import SwiftUI

struct BottomSheetTabBarView: View {
    @Binding var selectedFilter: TabBarContentFilter
    var animation: Namespace.ID
    let progress: CGFloat
    let imageHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabBarContentFilter.allCases, id: \.self) { filter in
                TabBarItemView(filter: filter, selectedFilter: $selectedFilter, animation: animation)
            }
        }
        .frame(height: 44)
        .background(Color.white)
        .offset(y: progress > 0.99 ? -imageHeight : 0)
    }
}

struct TabBarItemView: View {
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

struct TabBarView_Previews: PreviewProvider {
    @Namespace static var animation
    
    static var previews: some View {
        BottomSheetTabBarView(selectedFilter: .constant(.posts), animation: animation, progress: 0.5, imageHeight: 140)
    }
}
