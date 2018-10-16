//
//  DownloadImagem.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 15/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import UIKit

class DownloadImagem {
    
    func convertImagem(url:String, completion: @escaping (UIImage) -> Void) {
        let url = URL(string: url)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else {return}
            //print(data)
            completion(UIImage(data: data)!)
        }
        task.resume()
    }
}
