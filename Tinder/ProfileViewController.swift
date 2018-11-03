//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Hamsika Pongubala on 11/2/18.
//  Copyright © 2018 Hamsika Pongubala. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {


  @IBOutlet weak var navBar: UIImageView!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        navBar.addGestureRecognizer(tapGestureRecognizer)
        navBar.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    

  
  @IBAction func didTap(_ sender: Any) {
  
    performSegue(withIdentifier: "ProfileView", sender: nil)
  }
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
