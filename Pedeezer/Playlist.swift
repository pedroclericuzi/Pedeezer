//
//  MusicasArtista.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 13/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import UIKit
import Foundation

class Playlist : UIViewController {
    let downloadImagem = DownloadImagem()
    var imagem: UIImageView?
    var nomeBanda:UILabel?
    var linkBanda:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "\(arrArtista[0].nome)"
        self.viewDetalhes()
    }
    
    func viewDetalhes() -> Void {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let navBarHeight = (navigationController?.navigationBar.frame.size.height)! + 20
        let myViewHeight = screenSize.height * 0.15
        let myView = UIView(frame: CGRect(x: 0, y: navBarHeight, width: screenSize.width, height: myViewHeight))
        myView.backgroundColor = UIColor(red: 0.04, green: 0.03, blue: 0.00, alpha: 0.13)
        self.view.addSubview(myView)
        
        downloadImagem.convertImagem(url: arrArtista[0].imagemUrl) { (output) in
            print(output)
            DispatchQueue.main.async {
                self.imagem  = UIImageView(frame: CGRect(x: screenSize.width * 0.04,
                                                         y: navBarHeight + (myViewHeight * 0.25),
                                                         width: myViewHeight*0.5,
                                                         height: myViewHeight*0.5));
                self.imagem?.image = output
                self.view.addSubview(self.imagem!)
            }
        }
        self.nomeBanda = UILabel(frame: CGRect(x: (screenSize.width * 0.04) + (myViewHeight*0.5) + 5,
                                               y: navBarHeight + (myViewHeight * 0.25),
                                               width: screenSize.width * 0.6,
                                               height: 17))
        self.nomeBanda?.font = UIFont(name: "Halvetica", size: 17)
        self.nomeBanda?.text = "Banda: \(arrArtista[0].nome)"
        self.nomeBanda?.textColor = UIColor.black
        self.view.addSubview(self.nomeBanda!)
        
        self.linkBanda = UILabel(frame: CGRect(x: (screenSize.width * 0.04) + (myViewHeight*0.5) + 5,
                                               y: navBarHeight + (myViewHeight * 0.25) + 20,
                                               width: screenSize.width * 0.6,
                                               height: 17))
        self.linkBanda?.font = UIFont(name: "Halvetica", size: 17)
        self.linkBanda?.text = "Ir para o perfil da banda"
        self.linkBanda?.textColor = UIColor.blue
        self.view.addSubview(self.linkBanda!)
        let click = UITapGestureRecognizer(target: self, action: #selector(Playlist.funcaoClique))
        self.linkBanda?.isUserInteractionEnabled = true
        self.linkBanda?.addGestureRecognizer(click)
        
    }
    
    func mTableView() {
        
    }
    
    @objc
    func funcaoClique(sender:UITapGestureRecognizer) {
        guard let url = URL(string: arrArtista[0].paginaUrl) else { return }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
