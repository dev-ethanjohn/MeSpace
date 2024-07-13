//
//  TabBarContentFilter.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/13/24.
//
//
//  ProfileFilter.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/2/24.
//

import Foundation

enum TabBarContentFilter: Int, CaseIterable, Identifiable {
    case posts
    case collects
    
    var title: String {
        switch self {
        case .posts:
            return "Posts"
        case .collects:
            return "Collects"
        }
    }
    
    var id: Int { return self.rawValue}
}
