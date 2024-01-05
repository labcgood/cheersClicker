//
//  ViewController.swift
//  cheersClicker
//
//  Created by Labe on 2024/1/5.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var touchPlayer = AVPlayer()
    
    var cheersCounte = 0
    
    let backgroundArray = ["酒吧", "夜店", "超商", "居酒屋"]
    var currentPlace = "酒吧"
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var animateImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var cheersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: "乾杯", withExtension: "mp3")!
        let player = AVPlayerItem(url: url)
        touchPlayer.replaceCurrentItem(with: player)
    }

    @IBAction func cheers(_ sender: Any) {
        cheersCounte += 1
        countLabel.text = "\(cheersCounte)"
        
        var images = [UIImage]()
        for i in 0...3 {
            images.append(UIImage(named: "beer-\(i)")!)
        }
        animateImageView.animationImages = images
        animateImageView.animationDuration = 0.3
        animateImageView.animationRepeatCount = 1
        animateImageView.startAnimating()

        touchPlayer.rate = 0.01
        touchPlayer.play()
        touchPlayer.seek(to: .zero)
    }

    @IBAction func next(_ sender: Any) {
        cheersCounte = 0
        countLabel.text = "\(cheersCounte)"
        
        var newPlace = backgroundArray.randomElement()!
        while currentPlace == newPlace {
            newPlace = backgroundArray.randomElement()!
        }
        currentPlace = newPlace
        backgroundImageView.image = UIImage(named: currentPlace)
    }
    
}

