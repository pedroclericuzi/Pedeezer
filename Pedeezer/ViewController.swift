//
//  ViewController.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 10/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import UIKit

var indexArtista = 0
class ViewController: UITableViewController {
    var dados:[String] = ["Pedro", "Vinicius", "Batista"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "Choose your singer"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Teste")
        cell.textLabel?.text = dados[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexArtista = indexPath.row
        let playlist = Playlist()
        self.navigationController?.pushViewController(playlist, animated: false)
    }
    
}

