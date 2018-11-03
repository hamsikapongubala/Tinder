//
//  CardsViewController.swift
//  Tinder
//
//  Created by Hamsika Pongubala on 11/2/18.
//  Copyright © 2018 Hamsika Pongubala. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UIGestureRecognizerDelegate {


  @IBOutlet weak var cardView: UIView!
  
  
  var cardInitialCenter: CGPoint!
  
  //new card
    var newlyCreatedCard: UIImageView!
    var newlyCreatedCardOriginalCenter: CGPoint!
  
    //card
    var cardOriginalCenter: CGPoint!
    var cardDownOffset: CGFloat!
    var cardUp: CGPoint!
    var cardDown: CGPoint!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        cardDownOffset = 160
        cardUp = cardView.center // The initial position of the tray
        cardDown = CGPoint(x: cardView.center.x ,y: cardView.center.y + cardDownOffset)
        // Do any additional setup after loading the view.
    }
  
  
   @objc func cardPan(_ sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: view)
    
        if sender.state == .began {
            print("Gesture began")
            newlyCreatedCard = sender.view as? UIImageView
            newlyCreatedCardOriginalCenter = newlyCreatedCard.center
        }
        else if sender.state == .changed {
          
            print("Gesture is changing")
            newlyCreatedCard.center = CGPoint(x: newlyCreatedCardOriginalCenter.x + translation.x, y: newlyCreatedCardOriginalCenter.y + translation.y)
        }
        else if sender.state == .ended {
          
            print("Gesture ended")
        }
    }
  
  
  
  @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
  
    let location = sender.location(in: view)
    let translation = sender.translation(in: view)
    
        if sender.state == .began {
            print("Gesture began")
            //cardView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
            UIView.animate(withDuration: 1.0, animations: {
                self.cardView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))})

        } else if sender.state == .changed {
            print("Gesture is changing")
            if location.x < cardView.center.x{
              
                //Swipe Left
               cardView.transform = view.transform.rotated(by: CGFloat(-45 * M_PI / 180))
            }
            else{
              
                //Swipe Right
                cardView.transform = view.transform.rotated(by: CGFloat(45 * M_PI / 180))
            }
          
        } else if sender.state == .ended {
            print("Gesture ended")
 
            self.cardView.alpha = 1
            if translation.x > 50{
              
                UIView.animate(withDuration:0.4, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.cardView.center = CGPoint(x: self.cardView.center.x + 200, y: self.cardView.center.y + 80 )
                    self.cardView.alpha = 0
                })
            }else if translation.x > 50{
              
                UIView.animate(withDuration:0.4, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.cardView.center = CGPoint(x: self.cardView.center.x - 200, y: self.cardView.center.y + 80 )
                    self.cardView.alpha = 0
                })
              
            }
          
            cardView.transform = CGAffineTransform.identity
          
        }
  
  
  
  }
  

 
  
  
  @IBAction func didTap(_ sender: Any) {
    
    performSegue(withIdentifier: "ProfileView", sender: nil)
  
  }
  
 
  
}
