//
//  SwitchingViewController.swift
//  MultiViewAppTest
//
//  Created by Viktor Bilyk on 2017-10-04.
//  Copyright © 2017 Shifty Land LLC. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    //PRIVATE INSTANCE VARIABLES
    private var _blueViewController:BlueViewController!
    private var _yellowViewController:YellowViewController!
    
    
    override func viewDidLoad() {
        //
        super.viewDidLoad()
        
        self._blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
        
        self._blueViewController.view.frame = view.frame
        switchingViewController(from: nil, to: self._blueViewController)
        
        
    }
    
    
    //
    
    private func switchingViewController(from fromVC:UIViewController?,
    to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
            
        }
        
    }
    
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        if self._yellowViewController?.view.superview == nil {
            //
            if self._yellowViewController == nil {
                self._yellowViewController = storyboard?.instantiateViewController(withIdentifier: "Yellow") as! YellowViewController
            }
        }
        else if self._yellowViewController?.view.superview == nil {
            //
            if self._yellowViewController == nil {
                self._blueViewController = storyboard?.instantiateViewController(withIdentifier: "Blue") as! BlueViewController
            }
        }
        
        if self._blueViewController != nil && self._blueViewController!.view.superview != nil {
            //
            self._yellowViewController.view.frame = view.frame
            switchingViewController(from: self._blueViewController, to: self._yellowViewController)
            
        }
        else {
            self._blueViewController.view.frame = view.frame
            switchingViewController(from: self._yellowViewController, to: self._blueViewController)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        if self._blueViewController != nil && self._blueViewController!.view.superview == nil {
            self._blueViewController = nil
        }
        
        if self._yellowViewController != nil && self._yellowViewController!.view.superview == nil {
            self._yellowViewController = nil
        }
    }
}
