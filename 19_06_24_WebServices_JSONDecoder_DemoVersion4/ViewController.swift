//
//  ViewController.swift
//  19_06_24_WebServices_JSONDecoder_DemoVersion4
//
//  Created by Vishal Jagtap on 07/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    var jsonDecoder : JSONDecoder?

    override func viewDidLoad() {
        super.viewDidLoad()
       parseJSON()
    }

    private func parseJSON(){
        
        url = URL(string: Constants.url)
        
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        
        urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession?.dataTask(with: urlRequest!, completionHandler: { data, response, error in
            self.jsonDecoder = JSONDecoder()
            
            do{
                let apiRepsonse = try self.jsonDecoder?.decode([University].self, from: data!)
                print(apiRepsonse)
            }catch{
                print(error)
            }
            
        })
        dataTask?.resume()
    }
}
 
