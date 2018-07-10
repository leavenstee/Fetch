//
//  ViewController.swift
//  Fetch-Example
//
//  Created by Steven Lee on 7/8/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fetch = Fetch()
        print(fetch.get(urlString: "https://taco-randomizer.herokuapp.com/random", params: [:]))
        
    }


}

