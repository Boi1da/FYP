//
//  presentMetricsAnalysisViewController.swift
//
//
//  Created by Armani on 05/02/2018.
//

import UIKit

class presentMetricsAnalysisViewController: NSObject, UIViewControllerAnimatedTransitioning {

    var cellFrame : CGRect!
    var cellTransform  : CATransform3D!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    
        
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let destination = transitionContext.viewController(forKey: .to) as! MetricAnalysisViewController
        let containerView = transitionContext.containerView
        
        containerView.addSubview(destination.view)
   
        //Initial State of
        let widthConstraint = destination.metricAnalysisScrollView.widthAnchor.constraint(equalToConstant: 200)
        let heightConstraint = destination.metricAnalysisScrollView.heightAnchor.constraint(equalToConstant: 150)
        let bottomConstraint = destination.metricAnalysisScrollView.bottomAnchor.constraint(equalTo: destination.metricAnalysisBackground.bottomAnchor)
        
        containerView.layoutIfNeeded()
        
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, bottomConstraint])
        
        let translate = CATransform3DMakeTranslation(cellFrame.origin.x, cellFrame.origin.y, 0.0)
        let tranform = CATransform3DConcat(translate, cellTransform)
        
        destination.view.layer.transform = tranform
        destination.view.layer.zPosition = 999
        
        let animator = UIViewPropertyAnimator(duration: 0.6, dampingRatio: 0.7) {
            //Final state
            NSLayoutConstraint.deactivate([widthConstraint, heightConstraint, bottomConstraint])
            destination.view.layer.transform = CATransform3DIdentity
            destination.view.layoutIfNeeded()
        }
        
        animator.addCompletion{ (finished) in
            //When its completed
            transitionContext.completeTransition(true)
        }
        
         animator.startAnimation()
        
    }
    

    
}
