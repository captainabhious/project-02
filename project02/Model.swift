//
//  Model.swift
//  project02
//
//  Created by Abhi Singh on 10/11/17.
//  Copyright © 2017 Abhi Singh. All rights reserved.
//

import Foundation

// useful to convert JSON data to objects specific to app's domain in a model definition b/c most apps follow MVC design pattern
// sports news will provide title, description, and urlToImage
// wish to implement a model w/ an initializer that will accept a JSON obj & method making HTTP request to newsapi's endpoint & then asynchronously returning an array of sports news objects
// JSON serialization - object that converts between JSON and the equivalent Foundation objects

//struct Espn {
//    let articleTitle: String
//    let articleDescription: String
//    let articleImageUrl: URL
//    let articleUrl: URL
//    let articleAuthor: String?
//    
//     //need initializer that can take in JSON obj (NSDictionary)
//    init(json: [String: AnyObject]) throws {
//        guard let articleImageUrl = json["urlToImage"] as? URL else {
//            throw SerializationError.invalid("urlToImage", URL.self)
//        }
//        guard let articleTitle = json["title"] as? String else {
//            throw SerializationError.missing("Article's Title is Missing")
//        }
//        guard let articleUrl = json["url"] as? URL else {
//            throw SerializationError.invalid("url", URL.self)
//        }
//        guard let articleDescription = json["description"] as? String else {
//            throw SerializationError.missing("Article's Description is Missing")
//        }
//        guard let articleAuthor = json["author"] as? String else {
//            throw SerializationError.missing("Article's Author is Missing")
//        }
//
//        self.articleTitle = articleTitle
//        self.articleDescription = articleDescription
//        self.articleImageUrl = articleImageUrl
//        self.articleUrl = articleUrl
//        self.articleAuthor = articleAuthor
//    }
//
//}


enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}



struct News: Decodable {
//    let status: String?
//    let source: String?
//    let sortBy: String?
    let articles: [Article]?
}

struct Article: Decodable {
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String?
}

//////

struct NewsNews: Decodable {
    let articles: [NewsArticle]?
}

struct NewsArticle: Decodable {
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String?
}



