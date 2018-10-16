//
//  ListaMusicas.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 15/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import Foundation
import UIKit

class ListaMusicas {
    let urlPt1 = "https://api.deezer.com/artist/"
    let urlPt2_count = "/top"
    let urlPt2_getMusicas = "/top?limit="
    func gettingCountMusicas(i:Int, completion: @escaping (Int) -> Void){
        let concatUrl = urlPt1 + String(i) + urlPt2_count
        let url = URL(string: concatUrl)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else {return}
            do {
                let serializeJson = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                completion(serializeJson!["total"] as! Int)
            } catch let erro {
                print ("Erro: \(erro)");
            }
            
        }
        task.resume()
    }
    
    func getMusicasJSON(artista:Int, qtd:Int, completion: @escaping ([Musicas]) -> Void){
        var arrMusicas:[Musicas] = []
        let concatUrl = urlPt1 + String(artista) + urlPt2_getMusicas + String(qtd)
        let url = URL(string: concatUrl)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else {return}
            do {
                let decodeData = try JSONDecoder().decode(DataMusic.self, from: data)
                for i in 0 ..< qtd {
                    arrMusicas.append(Musicas(id: decodeData.musicas[i].id, nome: decodeData.musicas[i].nome, preview: decodeData.musicas[i].preview))
                }
                completion(arrMusicas);
            } catch let erro {
                print ("Erro: \(erro)");
            }
            
        }
        task.resume()
    }
    
}
