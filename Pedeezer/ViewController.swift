//
//  ViewController.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 10/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import UIKit

var arrArtista:[Artistas] = []
class ViewController: UITableViewController {
    var dados:[Artistas] = []
    let listaArtistas = ListaArtistas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "Choose your singer"
        DispatchQueue.global(qos: .background).async {
            for i in 0 ..< 10 {
                self.listaArtistas.parsingJSON(i: i) {(output) in
                    //print(output[0].id)
                    self.dados.append(Artistas(id: output[0].id, nome: output[0].nome, imagemUrl: output[0].imagemUrl, paginaUrl: output[0].paginaUrl))
                    //self.dados.append(output[0].nome)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Teste")
        cell.textLabel?.text = dados[indexPath.row].nome
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        arrArtista = [dados[indexPath.row]]
        let playlist = Playlist()
        self.navigationController?.pushViewController(playlist, animated: false)
    }
    
}

