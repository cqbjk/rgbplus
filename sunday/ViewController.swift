//
//  ViewController.swift
//  sunday
//
//  Created by Quabblejack.com on 7/19/15.
//  Copyright (c) 2015 CQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var squareView: UIView!
    @IBOutlet var opacitySlider: UISlider!
    @IBOutlet var redButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    @IBOutlet var blueButton: UIButton!
    @IBOutlet var rotateButton: UIButton!
    
    var currentColor: CurrentColor = .Red

    // could do CurrentColor.Red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setDefaultColor()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }

    @IBAction func updateColor(){
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let opacity = CGFloat(opacitySlider.value)
        
        squareView.backgroundColor = UIColor(red: red, green:green, blue:blue, alpha: opacity)
        let defaults = NSUserDefaults.standardUserDefaults()  //1
        defaults.setFloat(redSlider.value, forKey: "red")   //2
        defaults.setFloat(greenSlider.value, forKey: "green")
        defaults.setFloat(blueSlider.value, forKey: "blue")
        defaults.synchronize()    //3
    
    }
    
    
    
    @IBAction func setRed(sender: AnyObject) {
        currentColor = .Red
        setDefaultColor()
    }
    @IBAction func setGreen(sender: AnyObject) {
        currentColor = .Green
        setDefaultColor()
    }
    @IBAction func setBlue(sender: AnyObject) {
        currentColor = .Blue
        setDefaultColor()
    }
    
    @IBAction func rotateImage(sender: UIButton) {
        UIView.animateWithDuration(2.0, animations: {
            self.squareView.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
        })
    }
    
    func setDefaultColor(){
        switch currentColor{
        case .Red:
            redSlider.value = 1
            greenSlider.value = 0
            blueSlider.value = 0
        case .Green:
            redSlider.value = 0
            greenSlider.value = 1
            blueSlider.value = 0
        case .Blue:
            redSlider.value = 0
            greenSlider.value = 0
            blueSlider.value = 1
        }
        updateColor()
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openColor") {
            let newViewController = segue.destinationViewController as! UIViewController
            newViewController.view.backgroundColor = squareView.backgroundColor
        }
    }




}

enum CurrentColor{
    case Red
    case Green
    case Blue
}

