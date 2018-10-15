//
//  Artistas.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 14/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import Foundation

struct Artistas {
    let id : Int
    let nome : String
    let imagemUrl : String
    let paginaUrl : String
    
    init(json : [String:Any]) {
        id = json["id"] as? Int ?? -1
        nome = json["name"] as? String ?? ""
        imagemUrl = json["picture_small"] as? String ?? ""
        paginaUrl = json["share"] as? String ?? ""
    }
    
    init(id:Int, nome: String, imagemUrl:String, paginaUrl:String) {
        self.id = id
        self.nome = nome
        self.imagemUrl = imagemUrl
        self.paginaUrl = paginaUrl
    }
}
