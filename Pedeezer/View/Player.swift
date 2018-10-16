//
//  Player.swift
//  Pedeezer
//
//  Created by Pedro Clericuzi on 16/10/2018.
//  Copyright © 2018 Pedro Clericuzi. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class Player : UIViewController {
    var tocando:Bool = false
    var avplayer : AVPlayer?
    var labelStatus:UILabel?
    var btPlay:UIButton?
    var btPause:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
        self.loadRadio(radioURL: urlMusica!)
        self.itensTela()
        self.statusPlay()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        avplayer?.pause()
    }
    
    func itensTela() -> Void {
        self.btPlay = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        self.btPlay?.backgroundColor = .black
        self.btPlay?.setTitle("Play", for: .normal)
        self.btPlay?.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        self.view.addSubview(btPlay!)
        
        self.btPause = UIButton(frame: CGRect(x: 100, y: 200, width: 50, height: 50))
        self.btPause?.backgroundColor = .black
        self.btPause?.setTitle("Pause", for: .normal)
        self.btPause?.addTarget(self, action: #selector(pauseAudio), for: .touchUpInside)
        self.view.addSubview(btPause!)
        
        self.labelStatus = UILabel(frame: CGRect(x: 100, y: 300, width: 200, height: 20))
        self.labelStatus?.font = UIFont(name: "Halvetica", size: 17)
        self.labelStatus?.textColor = UIColor.black
        self.view.addSubview(self.labelStatus!)
    }
    
    func statusPlay() -> Void {
        DispatchQueue.main.async {
            
            self.avplayer?.addPeriodicTimeObserver(forInterval: CMTimeMake(value: 1, timescale: 600), queue: DispatchQueue.main, using: { time in
                if self.avplayer?.timeControlStatus == AVPlayer.TimeControlStatus.playing{
                    self.labelStatus?.text = ""
                    self.btPlay?.isHidden = true
                    self.btPause?.isHidden = false
                }
                if self.avplayer?.timeControlStatus == AVPlayer.TimeControlStatus.paused{
                    self.btPlay?.isHidden = false
                    self.btPause?.isHidden = true
                }
                
            })
        }
    }
    
    func loadRadio(radioURL: String) {
        guard let url = URL.init(string: radioURL) else { return }
        let playerItem = AVPlayerItem.init(url: url)
        avplayer = AVPlayer.init(playerItem: playerItem)
    }
    
    @objc func playAudio(sender: UIButton!) {
        avplayer?.play()
        tocando = true
        self.labelStatus?.text = "Carregando..."
    }
    
    @objc func pauseAudio(sender: UIButton!) {
        avplayer?.pause()
        tocando = false
    }
}
