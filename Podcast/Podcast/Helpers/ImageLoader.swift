//
//  ImageLoader.swift
//  Podcast
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation
import  Kingfisher

struct ImageLoader {
    
    static var shared = ImageLoader()
    
    func loadImage(with url: String?, image: UIImageView) {
        if let url = url {
            let url = URL(string: url)
            image.kf.setImage(with: url, placeholder: UIImage(named: "movie"))
        }
    }
}
 
