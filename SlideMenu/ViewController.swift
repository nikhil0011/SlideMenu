//
//  ViewController.swift
//  SlideMenu
//
//  Created by Admin on 12/13/18.
//  Copyright © 2018 Travelogy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
         *The system reads your storyboard, initializes the root view controller, prepares it by calling viewDidLoad and viewWillAppear, adds it to the window and shows the window.
         
         What happens is the system cannot just set the window to the front and animate the view controller onto it, because it's the first view controller and you are not push/popping of a nav controller. And viewDidLoad can take some time... So the Default.png is showing in the meanwhile until the view controller is ready.
         
         Then it calls viewDidAppear, when it has actually appeared. So that's where you should be able to access a keyWindow
         */
        showMenu()
    }
    let blackView: UIView = UIView()
    fileprivate func showMenu(){
        if let window = UIApplication.shared.keyWindow{
            debugPrint("working")
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
            })
        }
    }
    
    @objc fileprivate func handleDismiss(){
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
        })
    }
}

