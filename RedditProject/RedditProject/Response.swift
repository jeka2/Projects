//
//  Response.swift
//  RedditProject
//
//  Created by Yevgeniy Ivanov on 10/14/21.
//

import Foundation

struct Response: Decodable {
    let kind: String
    let data: Data
    
}

struct Data: Decodable {
    let dist: Int
    let children: [TopDataChild]
}

struct TopDataChild : Decodable {
    let data: ChildData
}

struct ChildData : Decodable {
    let subreddit: String
    let score: Int
    let title: String
    
}
//Dispatch.main.async
