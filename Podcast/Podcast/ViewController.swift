//
//  ViewController.swift
//  Podcast
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit
import PodcastAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let api = API()
        api.getPodcasts { (response) in
            print(response)
        }
    }
}

