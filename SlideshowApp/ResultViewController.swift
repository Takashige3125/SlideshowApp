//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 秋山剛成 on 2021/03/01.
//

import UIKit

class ResultViewController: UIViewController {
    
    var img0 = UIImage(named:"image0")!
    
    var img1 = UIImage(named:"image1")!
    
    var img2 = UIImage(named:"image2")!
    
    lazy var img_list = [self.img0, self.img1, self.img2]
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImage!
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    @IBOutlet weak var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        image1.image = image
    }

        // Do any additional setup after loading the view.
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

