//
//  OverviewViewController.swift
//  FYP
//
//  Created by Armani on 20/01/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit

/*
class OverviewViewController: UIViewController {

    //Outlets
    @IBOutlet weak var resultLabel1: UILabel!
    @IBOutlet weak var resultLabel2: UILabel!
    @IBOutlet weak var resultLabel3: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
   
    @IBOutlet weak var resultLabelMain: UILabel!
    @IBOutlet weak var resultLabelName: UILabel!
    
    @IBOutlet weak var resultRing1: MKRingProgressView!
    @IBOutlet weak var resultRing2: MKRingProgressView!
    @IBOutlet weak var resultRing3: MKRingProgressView!
    @IBOutlet weak var resultRingMain: MKRingProgressView!

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //Variables
    var titleText : String?
    
    override func viewDidAppear(_ animated: Bool) {
         //Change once i've figured out pulling from the server
        let results = [72, 56, 22, 44]
        resultLabel1.animateToNumber(results[0], duration: 1)
        resultLabel2.animateToNumber(results[1], duration: 1)
        resultLabel3.animateToNumber(results[2], duration: 1)
        resultLabelMain.animateToNumber(results[3], duration: 1)
        
        resultRing1.animateTo(results[0])
        resultRing2.animateTo(results[1])
        resultRing3.animateTo(results[2])
        resultRingMain.animateTo(results[3])
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleText
        view.backgroundColor = UIColor(red:0.16, green:0.15, blue:0.17, alpha:1.00)
        
        //Set delegate and data source
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension OverviewViewController : UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "results", for: indexPath) as! ResultsCollectionViewCell
        return cell
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
}

extension MKRingProgressView {
    func animateTo(_ percentage : Int) {
        delay(0.1) {
            CATransaction.begin()
            CATransaction.setAnimationDuration(1)
            self.progress = Double(percentage)/100
            CATransaction.commit()
        }
    }
}

*/



