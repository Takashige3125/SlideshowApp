//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 秋山剛成 on 2021/03/01.
//

import UIKit

class ViewController: UIViewController {
    
    var img0 = UIImage(named:"image0")!
    
    var img1 = UIImage(named:"image1")!
    
    var img2 = UIImage(named:"image2")!
    
    var num: Int = 0
    
    var button_num = 0
    
    let width = UIScreen.main.bounds.size.width
            
    let height = UIScreen.main.bounds.size.height
    
    lazy var img_list = [self.img0, self.img1, self.img2]
    
    var timer_sec: Float = 0
    
    var now_playing:Int = 0
    
    // タイマー
    var timer: Timer!

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImage!
    
    lazy var bgImageWidth = image2.size.width
    lazy var bgImageHeight = image2.size.height
    lazy var scale = self.height / self.bgImageHeight
    
    @IBOutlet weak var segue_button: UIButton!
    
    
    @IBAction func segue_stop(_ sender: UIButton) {
        if self.timer != nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image1.image = self.img_list[self.num]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // segueから遷移先のResultViewControllerを取得する
    let resultViewController:ResultViewController = segue.destination as! ResultViewController
    // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
    resultViewController.image = image1.image
    }
    
    @IBAction func prev(_ sender: UIButton) {
        self.num = (self.num + 2) % 3
        if self.now_playing == 0 {
        image1.image = self.img_list[self.num]
        }
    }
    
    @IBAction func next(_ sender: UIButton) {
        self.num = (self.num + 1) % 3
        if self.now_playing == 0 {
        image1.image = self.img_list[self.num]
        }
    }
    @IBOutlet weak var button: UIButton!
    
    @IBAction func button_change(_ sender: UIButton) {
        self.button_num += 1
        if self.button_num % 2 == 0{
            sender.setTitle("再生", for: .normal)
        }
        else{
            sender.setTitle("停止", for: .normal)
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
        var elapsed: Float = self.timer_sec / 2
        var num = 0
        var value:Float = 0.0
        while value < elapsed {
            value += 1
            num += 1
        }
        num %= 3
        if self.now_playing != 0 {
            image1.image = self.img_list[num]
        }
    }
    
    @IBAction func startTimer(_ sender: Any) {
        self.now_playing = (self.now_playing + 1) % 2
    // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    }
    @IBAction func pauseTimer(_ sender: Any) {
        
        if self.timer != nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
        }
    }
    
}

