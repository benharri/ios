//
//  FirstViewController.swift
//  PG7
//
//  Created by CS344 Student on 11/29/16.
//  Copyright © 2016 NMU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
  @IBOutlet var latCoord : UITextField?
  @IBOutlet var longCoord : UITextField?
  @IBOutlet var myButton : UIButton?

  
  @IBAction func buttonClicked(){
      tabBarController!.selectedIndex = 1
      tabBarController!.selectedIndex = 0

      let svc:SecondViewController = (self.tabBarController!.viewControllers![1] as? SecondViewController)!
      svc.enteredLat = (latCoord?.text)!
      svc.enteredLong = (longCoord?.text)!
      let latDouble : Double = Double(svc.enteredLat)!
      if(latDouble < 90 || latDouble > -90){
        var web:String = "https://www.google.com/maps/search/restaurants/@"
        web = web + svc.enteredLat
        web = web + ","
        web = web + svc.enteredLong + ",16z"
        let urlAdress:String = web
        let url:NSURL? = NSURL(string: urlAdress)
        let request:NSURLRequest = NSURLRequest (URL: url!)
        svc.myWeb?.loadRequest(request)
        
        tabBarController!.selectedIndex = 1
      }
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

