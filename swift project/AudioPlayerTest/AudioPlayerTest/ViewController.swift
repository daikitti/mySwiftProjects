//
//  ViewController.swift
//  AudioPlayerTest
//
//  Created by Have Dope on 26.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let minLabelTrack = UILabel()
    let maxLabelTrack = UILabel()
    let sliderPlayer = UISlider()
    let pauseButton = UIButton(type: .roundedRect)
    let stopButton = UIButton ( type: .roundedRect)
    let nextButton = UIButton ( type: .roundedRect)
    let segmetControll = UISegmentedControl()
    var imageTrack = UIImageView()
    var nameLabel = UILabel()
    var player: AVAudioPlayer?
    var PlayOn  = false
    let namesTrackArray = ["Домой(4)",
                           "Mixdown6",
                           "osen 2 reverb"]
    var trackNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlaySound()
        createSlider()
        createButton()
        createMinLabel()
        createMaxLabel()
        createDisplayLink()
        createStopButton()
        createNextButton()
        createNamesTrackLabel()
        createImageTrack()
        
      
        
        pauseButton.addTarget(self, action: #selector(pauseButtonMetod(sender: )), for: .touchUpInside)
        sliderPlayer.addTarget(self, action: #selector(sliderValueChenge(param: )), for: .valueChanged)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(param: )), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped(param: UIButton){
      
        player?.stop()
        player?.currentTime = 0
        
        PlayOn = !PlayOn
        
        
        pauseButton.setTitle("Play", for: .normal)
          
        if trackNumber < namesTrackArray.count - 1{
            trackNumber += 1
            print(namesTrackArray.count , trackNumber)
            PlaySound()
            
        } else {
            trackNumber = 0
            PlaySound()
        }
        
                             
    }
    
    @objc func sliderValueChenge(param: UISlider){
        guard let playS = player else {return}
        PlayOn = false
        playS.stop()
        playS.currentTime = Double(sliderPlayer.value)
        pauseButton.setTitle("Play", for: .normal)
        minLabelTrack.text = String(format: "%.02f",(sliderPlayer.value / 60))
        
    }
    
    
    //MARK:  - Create UI
    
    func createImageTrack(){
        
        imageTrack.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageTrack.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 100)
        imageTrack.backgroundColor = .blue
        imageTrack.image = UIImage(named: namesTrackArray[trackNumber])
        imageTrack.clipsToBounds = false
        imageTrack.layer.shadowColor = UIColor.black.cgColor
        imageTrack.layer.shadowOpacity = 1
        imageTrack.layer.shadowOffset =  CGSize(width: 0, height: 20)
        imageTrack.layer.shadowRadius = 24
        imageTrack.layer.shadowPath = UIBezierPath(roundedRect: imageTrack.bounds, cornerRadius: 10).cgPath
        self.view.addSubview(imageTrack)
        
    }
    
    func createNamesTrackLabel(){
        nameLabel.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        nameLabel.textAlignment = .center
        nameLabel.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 120)
        nameLabel.text = "Вы слушаете: " + namesTrackArray[trackNumber]
        self.view.addSubview(nameLabel)
    }
    
    func createDisplayLink() {
        let displaylink = CADisplayLink(target: self, selector: #selector(step))
        
        displaylink.add(to: .current,forMode: .default)
    }
    
    @objc func step(displaylink: CADisplayLink) {
        sliderPlayer.value = Float(player!.currentTime)
        minLabelTrack.text = String(format: "%.02f",(sliderPlayer.value / 60))
        nameLabel.text = "Вы слушаете: " + namesTrackArray[trackNumber]
        imageTrack.image = UIImage(named: namesTrackArray[trackNumber])
        sliderPlayer.maximumValue = Float(player!.duration)
        maxLabelTrack.text = String(format: "%.02f", (sliderPlayer.maximumValue / 60))
        
        
        if player?.isPlaying == false{
            stopButton.isEnabled = false
        }else{
            stopButton.isEnabled = true
        }
    }
    
    func createSlider(){
        sliderPlayer.frame = CGRect(x: 0, y: 0, width: 330, height: 31)
        sliderPlayer.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 150)
        sliderPlayer.minimumTrackTintColor = .orange
        sliderPlayer.maximumTrackTintColor = .black
        sliderPlayer.thumbTintColor = .orange
        sliderPlayer.minimumValue = 0
        view.addSubview(sliderPlayer)
    }
    
    func createButton(){
        //pauseButton.configuration?.cornerStyle = .capsule
        pauseButton.frame = CGRect(x: 0, y: 0, width: 90, height: 70)
        pauseButton.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 250)
        pauseButton.backgroundColor = .orange
        pauseButton.layer.cornerRadius = 35
        
        pauseButton.setTitle("Play", for: .normal)
        pauseButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        pauseButton.tintColor = .black
        self.view.addSubview(pauseButton)
    }
    
    func createStopButton(){
       // stopButton.configuration?.cornerStyle = .capsule
        stopButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        stopButton.center = CGPoint(x: self.view.center.x + 120, y: self.view.center.y + 270)
        stopButton.backgroundColor = .orange
        stopButton.layer.cornerRadius = 15
        
        stopButton.setImage(UIImage(named: "icons8"), for: .normal)
        stopButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        stopButton.tintColor = .black
        self.view.addSubview(stopButton)
        
        stopButton.addTarget(self, action: #selector(StopButton(param: )), for: .touchUpInside)
        
    }
        func createNextButton(){
            
          //  nextButton.configuration?.cornerStyle = .capsule
            nextButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            nextButton.center = CGPoint(x: self.view.center.x - 120, y: self.view.center.y + 270)
            nextButton.backgroundColor = .orange
            nextButton.layer.cornerRadius = 15
            
            nextButton.setImage(UIImage(named: "iconsNEXT"), for: .normal)
            nextButton.tintColor = .black
            self.view.addSubview(nextButton)
        
    }
    
    @objc func StopButton(param:UIButton) {
        
        player?.stop()
        player?.currentTime = 0
        PlayOn = !PlayOn
        
        pauseButton.setTitle("Play", for: .normal)
        
    }
    
    func createMinLabel(){
        minLabelTrack.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        minLabelTrack.center = CGPoint(x: sliderPlayer.frame.minX + 20, y: sliderPlayer.frame.minY + 40)
        minLabelTrack.text = "0.0"
        self.view.addSubview(minLabelTrack)
    }
    
    func createMaxLabel(){
        maxLabelTrack.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        maxLabelTrack.center = CGPoint(x: sliderPlayer.frame.maxX - 20, y: sliderPlayer.frame.minY + 40)
        maxLabelTrack.text = "0.0"
        self.view.addSubview(maxLabelTrack)
        
    }
    
    //MARK: Method
    
    func PlaySound(){
        guard let url = Bundle.main.url(forResource: namesTrackArray[trackNumber], withExtension: "mp3") else {return}
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else {return}
            
            print(player.duration / 60)
            
        }catch let error {
            print(error)
        }
    }
    
    @objc func pauseButtonMetod (sender: UIButton){
        guard let player = player else {return}
        
        if PlayOn == true {
            player.stop()
            PlayOn = false
            pauseButton.setTitle("Play", for: .normal)
            
        } else if PlayOn == false {
            player.play()
            PlayOn = true
            pauseButton.setTitle("Stop", for: .normal)
        }
    }
    
    
}

