//
//  Post.swift
//  MeSpace
//
//  Created by Ethan John Paguntalan on 7/27/24.
//

import Foundation

struct Post: Identifiable {
    
    let id: Int
    let imageURL: String
    let author: String
    let headline: String
    var likes: Int
    let views: Int
    var isLked: Bool
    
    static func samplePosts() -> [Post] {
        [
            Post(id: 1, imageURL: "profileheaderimage", author: "only_ej", headline: "toonzc character", likes: 0, views: 1270, isLked: false),
            Post(id: 2, imageURL: "ghibli2", author: "only_ej", headline: "Hyperrealism drawing", likes: 1, views: 987, isLked: false),
            Post(id: 3, imageURL: "street1", author: "only_ej", headline: "", likes: 0, views: 92, isLked: false),
            Post(id: 4, imageURL: "flower", author: "only_ej", headline: "", likes: 0, views: 12, isLked: false),
            Post(id: 5, imageURL: "ghibli5", author: "only_ej", headline: "", likes: 0, views: 45, isLked: false),
            Post(id: 6, imageURL: "room1", author: "only_ej", headline: "", likes: 0, views: 78, isLked: false)
        ]
    }
    
}
