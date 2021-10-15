//
//  ViewModel.swift
//  RedditProject
//
//  Created by Yevgeniy Ivanov on 10/14/21.
//

import Foundation

enum RedditError: Error {
    case parse
}

enum ExampleResult {
    case success([TopDataChild])
    case failure(Error)
}

typealias RedditResponse = Result<[TopDataChild], RedditError>

struct ViewModel {
    static func fetch(subName: String,_ completion: @escaping (RedditResponse) -> ()) {
        if let url = URL(string: "https://reddit.com/r/\(subName.lowercased())/.json") {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, error, response in
                print("response completed") // point 3
                
                guard let data = data else {
                    return
                }
             
                guard let response: Response = try? JSONDecoder().decode(Response.self, from: data) else {
                    return
                }
                
                let responseData = response.data.children
                completion(.success(responseData))
                
                print("closure called") // point 4
            }.resume()
            
            
        }
        
    }
    
}


