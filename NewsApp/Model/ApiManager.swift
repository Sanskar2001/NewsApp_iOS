//
//  ApiManager.swift
//  NewsApp
//
//  Created by Sanskar Atrey on 16/10/21.
//

import Foundation


protocol ApiManagerDelegate{
    func didUpdateNews(newsData:NewsDataModel?)
    func didFailWithError(error:Error)
}

class ApiManager{
    let newsUrl="https://newsapi.org/v2/top-headlines?apiKey=47eb41c2e4094e6eb870d5531e950c2d"
    
    var delegate:ApiManagerDelegate?
    
    func fetchNewsByCountry(countryName:String)
    {
        let url="\(newsUrl)&country=\(countryName)"
        
        performRequest(urlString:url)
    }
    
    func performRequest(urlString:String){
        
        if let url=URL(string: urlString){
           
            let session=URLSession(configuration:.default)
            
            let task=session.dataTask(with: url, completionHandler: handler(data:response:error:))
            
            task.resume()
        }
    }
    
    func handler(data:Data?,response:URLResponse?,error:Error?)
    {
        if error != nil{
            print(error!)
        }
        
        
        if let safeData=data{
            
            delegate?.didUpdateNews(newsData: parseJSON(newsData: safeData))
        }
    }
    
    
    func parseJSON(newsData:Data)->NewsDataModel?{
        
        let decoder=JSONDecoder()
        do{
            let decodedData = try decoder.decode(NewsDataModel.self, from:newsData )
             return decodedData
        }
        catch{
            
            return nil
        }
        
    
    }
    
}
