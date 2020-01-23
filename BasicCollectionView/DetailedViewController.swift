//
//  DetailedViewController.swift
//  BasicCollectionView
//
//  Created by apple on 23/01/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {


    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    var dStrImg:UIImage!
    var dStrLbl:String!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        lbl.text=dStrLbl
        img.image=dStrImg
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

}
