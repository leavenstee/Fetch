//
//  Fetch.swift
//  Fetch-Example
//
//  Created by Steven Lee on 7/8/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import Foundation


class Fetch {

    static let sharedFetcher = Fetch()
    
    // MARK: Public Functions
    
    /**
     GET Request
     - parameters:
     - urlString: String of the url that is used to make the request
     - params: Dictonary of type [String:String] to pass with the request
     - completion: Completion block of type Any passed back from result of fetch
     */
    public func get(urlString: String, params: [String:String]?, completion: @escaping (_ result: Any) -> Void) {
        self.fetch(type: "GET", urlComponents: self.setupUrl(urlString: urlString, params: params ?? [:]) as NSURLComponents) { (json) in
            completion(json)
        }
    }
    /**
     POST Request
     - parameters:
     - urlString: String of the url that is used to make the request
     - params: Dictonary of type [String:String] to pass with the request
     - completion: Completion block of type Any passed back from result of fetch
     */
//    public func post(urlString: String, params: [String:String], completion: @escaping (_ result: [String : Any]) -> Void) {
//        self.fetch(type: "POST", urlComponents: self.setupUrl(urlString: urlString, params: params) as NSURLComponents) { (json) in
//            completion(json)
//        }
//    }
    /*
     PUBLIC METHOD: DELETE REQUEST
     */
//    public func delete(urlString: String, params: [String:String], completion: @escaping (_ result: [String : Any]) -> Void) {
//        self.fetch(type: "DELETE", urlComponents: self.setupUrl(urlString: urlString, params: params) as NSURLComponents) { (json) in
//            completion(json)
//        }
//    }
    /*
     PUBLIC METHOD: PUT REQUEST
     */
//    public func put(urlString: String, params: [String:String], completion: @escaping (_ result: [String : Any]) -> Void) {
//        self.fetch(type: "PUT", urlComponents: self.setupUrl(urlString: urlString, params: params) as NSURLComponents) { (json) in
//            completion(json)
//        }
//    }
    
    // MARK: Private Functions
    
    /** PRIVATE METHOD: FETCH
     *  THIS METHOD MAKES REQUEST BASED ON INFO PROVIDED
     *
     */
    private func fetch(type:String, urlComponents:NSURLComponents, completion: @escaping (_ result: Any) -> Void) {
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = type
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                completion(json)
            } catch {
                print("FETCH ERROR: \(error)")
                completion(error)
            }
        })
        task.resume()
    }
    
    /** PRIVATE METHOD: SETUP URL
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
