//
//  CustomAnimationTransition.swift
//  SampleUI
//
//  Created by m_hasegawa on 2018/06/18.
//  Copyright © 2018年 marcy. All rights reserved.
//

import UIKit


class CustomAnimationTransition: NSObject, UIViewControllerAnimatedTransitioning{

    let operation: UINavigationControllerOperation

    init(operation: UINavigationControllerOperation) {
        self.operation = operation
    }

    // MARK: - UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        switch operation {
        case .push:
            if let fromVC = transitionContext.viewController(forKey: .from) as? MainFirstViewController,
                let toVC = transitionContext.viewController(forKey: .to) as? ArticleDetailViewController {
                let containerView = transitionContext.containerView

                let cell = fromVC.collectionView?.cellForItem(at: (fromVC.collectionView?.indexPathsForSelectedItems?.first)!) as! ArticleCollectionViewCell
                let animationView = UIImageView(image: cell.imageView?.image)
                animationView.frame = containerView.convert((cell.imageView?.frame)!, from: cell.imageView?.superview)
                cell.imageView?.isHidden = true

                toVC.view.frame = transitionContext.finalFrame(for: toVC)
                toVC.view.alpha = 0
                toVC.imageView.isHidden = true

                containerView.addSubview(toVC.view)
                containerView.addSubview(animationView)

                UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {

                    toVC.view.alpha = 1.0
                    animationView.frame = containerView.convert(toVC.imageView.frame, from: toVC.view)
                }, completion: { finished in

                    toVC.imageView.isHidden = false
                    cell.imageView?.isHidden = false
                    animationView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                })

            }
        case .pop:
            if let fromVC = transitionContext.viewController(forKey: .from) as? ArticleDetailViewController,
                let toVC = transitionContext.viewController(forKey: .to) as? MainFirstViewController {
                let containerView = transitionContext.containerView

                let animationView = fromVC.imageView.snapshotView(afterScreenUpdates: false)
                animationView?.frame = containerView.convert(fromVC.imageView.frame, from: fromVC.imageView.superview)
                fromVC.imageView.isHidden = true

                let cell = toVC.collectionView?.cellForItem(at: fromVC.indexPath) as! ArticleCollectionViewCell
                cell.imageView.isHidden = true

                toVC.view.frame = transitionContext.finalFrame(for: toVC)

                containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
                containerView.addSubview(animationView!)

                UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {

                    fromVC.view.alpha = 0
                    animationView?.frame = containerView.convert(cell.imageView.frame, from: cell.imageView.superview)
                }, completion: { finished in

                    animationView?.removeFromSuperview()
                    fromVC.imageView.isHidden = false
                    cell.imageView.isHidden = false
                    transitionContext.completeTransition(true)
                })
            }
        default: transitionContext.completeTransition(true)
        }
    }
}
