//
//  NewsApiTest.swift
//  NewsAppTests
//
//  Created by Sanskar Atrey on 16/10/21.
//

import XCTest

class NewsApiTest: XCTestCase,ApiManagerDelegate {
   
    
    func didUpdateNews(newsData: Data) {
        print(newsData)
    }
    
    func didFailWithError(error: Error) {
      
    }
    

    
    
    func testFunc(){
        
        var apiManager:ApiManager=ApiManager()
       
        apiManager.delegate=self
        apiManager.fetchNewsByCountry(countryName:"us")
        
      
        
       
        
    }
    
}
