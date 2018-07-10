//
//  Fetch.swift
//  Fetch-Example
//
//  Created by Steven Lee on 7/8/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import Foundation


class Fetch {

    /*
     PUBLIC METHOD: GET REQUEST
     */
    func get(urlString: String, params: [String:String]) -> [String : Any] {
        return self.fetch(type: "GET", urlComponents: self.setupUrl(urlString: urlString, params: params) as NSURLComponents)
    }
    /*
     PUBLIC METHOD: POST REQUEST
     */
    func post(urlString: String, params: [String:String]) -> [String : Any] {
        return self.fetch(type: "POST", urlComponents: self.setupUrl(urlString: urlString, params: params) as NSURLComponents)
    }
    /*
     PUBLIC METHOD: DELETE REQUEST
     */
    func delete(urlString: String, params: [String:String]) -> [String : Any] {
        return self.fetch(type: "DELETE", urlComponents: self.setupUrl(urlString: urlString, params: params) as NSURLComponents)
    }
    /*
     PUBLIC METHOD: PUT REQUEST
     */
    func put(urlString: String, params: [String:String]) -> [String : Any] {
        return self.fetch(type: "PUT", urlComponents: self.setupUrl(urlString: urlString, params: params) as NSURLComponents)
    }
    
    /* PRIVATE METHOD: FETCH
     *  THIS METHOD MAKES REQUEST BASED ON INFO PROVIDED
     *
     */
    private func fetch(type:String, urlComponents:NSURLComponents) -> [String : Any] {
        var jsonData = [String : Any]()
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = type
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any]
            jsonData = json!
            print(jsonData)
        })
        task.resume()
        return jsonData
    }
    
    /* PRIVATE METHOD: SETUP URL
     *  THIS METHOD FORMATS THE URL WITH PARAMS PASSED IN
     *
     */
    private func setupUrl(urlString: String, params: [String:String]) -> URLComponents{
        let urlComponents = NSURLComponents(string: urlString)!
        var items = [URLQueryItem]()
        for (key,value) in params {
            items.append(URLQueryItem(name: key, value: value))
        }
        items = items.filter{!$0.name.isEmpty}
        if !items.isEmpty {
            urlComponents.queryItems = items
        }
        return urlComponents as URLComponents
    }
    
}
