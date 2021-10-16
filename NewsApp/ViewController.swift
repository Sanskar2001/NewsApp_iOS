//
//  ViewController.swift
//  NewsApp
//
//  Created by Sanskar Atrey on 16/10/21.
//

import UIKit

class ViewController: UIViewController,ApiManagerDelegate{
   
    
    @IBOutlet weak var tableView: UITableView!
    var newsItems=[News]()
    
    
    
    var apiManager=ApiManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate=self
        tableView.dataSource=self
        apiManager.fetchNewsByCountry(countryName: "us")
        
        tableView.register(UINib(nibName: "TableViewCell", bundle:nil), forCellReuseIdentifier: "ReusableCell")
    }

    func didUpdateNews(newsData: NewsDataModel?) {
        print(newsData!.totalResults)
        newsItems=newsData!.articles
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func didFailWithError(error: Error) {
      
    }
}

extension ViewController:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsItems.count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier:"ReusableCell", for: indexPath) as! TableViewCell
        cell.titleTextLabel?.text=newsItems[indexPath.row].title
        let urlString=newsItems[indexPath.row].urlToImage
        if let url=URL(string: urlString){
            DispatchQueue.main.async{
            
                if let url=URL(string: urlString){
                    
                   
                    let data = try? Data(contentsOf: url)
                    let image=UIImage(data: data!)
                    cell.newsImageView.image=image
                    
                }
            }
        }
        
        
        
    return cell
    }
    
  
 
    
    
}
