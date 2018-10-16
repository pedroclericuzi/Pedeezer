//
//  Musicas.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 15/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import Foundation

struct Musicas : Codable{
    var id:Int
    var nome:String
    var preview:String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nome = "title"
        case preview = "preview"
    }
    
    init(id:Int, nome:String, preview:String) {
        self.id = id
        self.nome = nome
        self.preview = preview
    }
    
}

struct DataMusic : Codable{
    var musicas:[Musicas]
    
    enum CodingKeys: String, CodingKey {
        case musicas = "data"
    }
}
