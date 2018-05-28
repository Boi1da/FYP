//
//  ResultsViewController.swift
//  FYP
//
//  Created by Armani on 28/01/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var technicalDebtVariableLabel: UILabel!
    @IBOutlet weak var technicalDebtCostLabel: UILabel!
    @IBOutlet weak var metricsCollectionView: UICollectionView!
    @IBOutlet weak var resultsTableView: UITableView!
    
    //StackView Commits Outlets
   
    @IBOutlet weak var commitsLabel: UILabel!
    @IBOutlet weak var commitsView: UIView!
    
    @IBOutlet weak var optionsStackView: UIStackView!
    
    //let PresentMetricsAnalysisViewController = presentMetricsAnalysisViewController()
    
    let results = [2089, 56, 22, 44]
    let percentageResults = [73, 10,12,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // navigationController?.setNavigationBarHidden(true, animated: false)
        
        metricsCollectionView.delegate = self
        metricsCollectionView.dataSource = self
        
        
        technicalDebtCostLabel.animateToNumberPounds(results[0], duration: 1)
        technicalDebtVariableLabel.animateToNumberPoundsPlus(results[1], duration: 2)
    }

}

extension ResultsViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "metricsCell", for: indexPath) as! ResultsCollectionViewCell
        let results = resultSections[indexPath.row]
        cell.costLabel.text = results["metricCost"] as? String
        cell.metricName.text = results["metricType"] as?String
        cell.resultArrowImage.image = results["arrowImage"] as? UIImage
        cell.metricResultLabel.text = results["metricGain"] as? String
        cell.metricView.backgroundColor = results["backgroundColor"] as? UIColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //if let vc = storyboard?.instantiateViewController(withIdentifier: "ResultsToAnalysis") as? MetricAnalysisViewController {
            //let repo = repoArray[indexPath.row]
        
            performSegue(withIdentifier: "ResultsToAnalysis", sender: indexPath)
        }
 
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ResultsToAnalysis" {
//            let toViewController = segue.destination as! MetricAnalysisViewController
//            let indexPath = sender as! IndexPath
//            let result = resultSections[indexPath.row]
//            let darkerColor = result["backgroundColor"] as? UIColor
//
//            toViewController.result = result
//            toViewController.indexPath = indexPath
//            toViewController.startColour = result["backgroundColor"] as? UIColor
//            toViewController.endColour = darkerColor?.darker(by: 20)
//            toViewController.metricPercentageNumber = percentageResults[indexPath.row]
//            toViewController.metricType = result["metricType"] as? String
//
//            toViewController.transitioningDelegate = self
//
//            let attributes = metricsCollectionView.layoutAttributesForItem(at: indexPath)!
//            let cellFrame = metricsCollectionView.convert(attributes.frame, to: view)
//
//            PresentMetricsAnalysisViewController.cellFrame = cellFrame
//            PresentMetricsAnalysisViewController.cellTransform = animateCell(cellFrame: cellFrame)
//
//            UIView.animate(withDuration: 0.5) {
//                self.setNeedsStatusBarAppearanceUpdate()
//            }
//        }
    }
    
    func animateCell(cellFrame: CGRect) -> CATransform3D {
        let angleFromX = Double((-cellFrame.origin.x) / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180.0)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
        let scaleMax: CGFloat = 1.0
        let scaleMin: CGFloat = 0.6
        if scaleFromX > scaleMax {
            scaleFromX = scaleMax
        }
        if scaleFromX < scaleMin {
            scaleFromX = scaleMin
        }
        let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
        
        return CATransform3DConcat(rotation, scale)
    }
}

//extension ResultsViewController : UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//        return presentMetricsAnalysisViewController
//    }


    
    




