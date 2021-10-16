//
//  NewsDataModel.swift
//  NewsApp
//
//  Created by Sanskar Atrey on 16/10/21.
//

import Foundation
struct NewsDataModel:Decodable{
    let articles:[News]
    let totalResults:Int
}
struct News:Decodable{
    let title:String
    let description:String
    let urlToImage:String
}
