//
//  ListaArtistas.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 14/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import Foundation

class ListaArtistas {
    let urlArtista = "https://api.deezer.com/artist/"
    func parsingJSON(i:Int, completion: @escaping ([Artistas]) -> Void){
        var arrArtistas:[Artistas] = []
        let concatUrl = urlArtista + String(i)
        let url = URL(string: concatUrl)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else {return}
            do {
                let serializeJson = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let artistas = Artistas(json: serializeJson as! [String : Any])
                if (artistas.id>0){
                    arrArtistas.append(Artistas(id: artistas.id, nome: artistas.nome, imagemUrl: artistas.imagemUrl, paginaUrl: artistas.paginaUrl))
                    completion(arrArtistas);
                }
            } catch let erro {
                print ("Erro: \(erro)");
            }
            
        }
        task.resume()
    }
}
