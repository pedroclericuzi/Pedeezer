//
//  MusicasArtista.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 13/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import UIKit

class Playlist : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "Artista \(indexArtista)"

    }
    
}
