//
//  ViewController.swift
//  BasicCollectionView
//
//  Created by apple on 23/01/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var basicCollectionView: UICollectionView!
    
    let productName=["Bike","Bag","Phone","Watch","Keys","Cycle","Bike","Bag","Phone","Watch","Keys","Cycle","Bike","Bag","Phone","Watch","Keys","Cycle"]
    let productImage=[#imageLiteral(resourceName: "Bike"),#imageLiteral(resourceName: "Bag"),#imageLiteral(resourceName: "Phone"),#imageLiteral(resourceName: "Watch"),#imageLiteral(resourceName: "Keys"),#imageLiteral(resourceName: "Cycle"),#imageLiteral(resourceName: "Bike"),#imageLiteral(resourceName: "Bag"),#imageLiteral(resourceName: "Phone"),#imageLiteral(resourceName: "Watch"),#imageLiteral(resourceName: "Keys"),#imageLiteral(resourceName: "Cycle"),#imageLiteral(resourceName: "Bike"),#imageLiteral(resourceName: "Bag"),#imageLiteral(resourceName: "Phone"),#imageLiteral(resourceName: "Watch"),#imageLiteral(resourceName: "Keys"),#imageLiteral(resourceName: "Cycle")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var layout=basicCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset=UIEdgeInsetsMake(0, 5, 0, 5)
            layout.minimumInteritemSpacing=5
            layout.itemSize=CGSize(width: (self.basicCollectionView.frame.size.width - 20)/2, height:self.basicCollectionView.frame.size.height/3)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text=productName[indexPath.row]
        cell.cellImage.image=productImage[indexPath.row]
        
        //Custom UI Setup for cell
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cell.layer.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath;

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Selected cell color
        //let selectCell=collectionView.cellForItem(at: indexPath)
        //selectCell?.layer.borderColor=#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //selectCell?.layer.borderWidth=2
        
        let detailVC:DetailedViewController=storyboard?.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        detailVC.dStrLbl=productName[indexPath.row]
        detailVC.dStrImg=productImage[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        
        
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        //Deselected cell color
        //let cell=collectionView.cellForItem(at: indexPath)
        //cell?.layer.borderColor=UIColor.lightGray.cgColor
        //cell?.layer.borderWidth=1.0
    }
    
    
}
