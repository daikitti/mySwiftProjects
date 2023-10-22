//
//  ViewController.swift
//  AudioPlayerUISleder
//
//  Created by Have Dope on 16.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var timeTrackLabel: UILabel!{
        didSet{
            timeTrackLabel.text = ""
        }
    }
    
    @IBOutlet var sliderBoard: UISlider!{
        didSet{
            sliderBoard.tintColor = .cyan
            sliderBoard.maximumTrackTintColor = .systemMint
        }
    }
    
    
    var player = AVAudioPlayer()
    let slider = UISlider()
    var segmentControll = UISegmentedControl()
    var menuArray = ["one","two","thee"]
    var libSong = ["Домой(4)","Mixdown6", "osen 2 reverb"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create segmentControll
        self.segmentControll = (UISegmentedControl(items: self.menuArray))
        self.segmentControll.frame = CGRect(x: 100, y: 700, width: 200, height: 30)
        self.view.addSubview(segmentControll)
        
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        slider.thumbTintColor = .black
        slider.maximumTrackTintColor = .black
        slider.minimumTrackTintColor = .magenta
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        
        self.slider.addTarget(self, action: #selector(chengeSlider) , for: .valueChanged)
        self.segmentControll.addTarget(self, action: #selector(segmentValue), for: .valueChanged)
        
        self.view.addSubview(slider)
        
        
        // self.player.play()
    }
    
    
    //MARK: TARGET
    @objc func chengeSlider(sender: UISlider ) {
        if sender == slider{
            self.player.currentTime = TimeInterval(sender.value)
            timeTrackLabel.text = (String(format: "%.2f", (TimeInterval(sender.value))/60))
        }
    }
    
   @objc func segmentValue(target: UISegmentedControl)
    {if target == self.segmentControll{
        let selectedIndex = target.selectedSegmentIndex
        do {
            if let audioPath = Bundle.main.path(forResource: libSong[selectedIndex], ofType: "mp3"){
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        print(selectedIndex)
    }
        
    }
    //----------
    
    @IBAction func playButton(_ sender: UIButton) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        self.player.pause()
    }
    
    
    
    @IBAction func sliderAction(_ sender: Any) {
        self.player.volume = self.sliderBoard.value
        
    }
    
    
    
}

