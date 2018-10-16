//
//  ViewController.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 10/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import UIKit
import AVFoundation

var arrArtista:[Artistas] = []
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var dados:[Artistas] = []
    let listaArtistas = ListaArtistas()
    var menuTableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "Choose your singer"
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.menuTableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        self.view.addSubview(menuTableView)
        
        DispatchQueue.global(qos: .background).async {
            for i in 0 ..< 10 {
                self.listaArtistas.parsingJSON(i: i) {(output) in
                    //print(output[0].id)
                    self.dados.append(Artistas(id: output[0].id, nome: output[0].nome, imagemUrl: output[0].imagemUrl, paginaUrl: output[0].paginaUrl))
                    //self.dados.append(output[0].nome)
                    DispatchQueue.main.async {
                        self.menuTableView!.reloadData()
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Artistas")
        cell.textLabel?.text = dados[indexPath.row].nome
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        arrArtista = [dados[indexPath.row]]
        let playlist = Playlist()
        self.navigationController?.pushViewController(playlist, animated: false)
    }
    
}

