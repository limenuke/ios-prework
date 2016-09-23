//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Liang Rui on 9/18/16.
//  Copyright © 2016 Etcetera. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var segment: UISegmentedControl!
    var tipArray = [Int]()
    @IBOutlet weak var tabSet1: UISlider!
    @IBOutlet weak var tabSet2: UISlider!
    @IBOutlet weak var tabSet3: UISlider!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("frstElem") != nil {
            let intValue = defaults.integerForKey("frstElem")
            tabSet1.value = Float(intValue)
        } else {
            tabSet1.value = 15
        }
        
        if defaults.objectForKey("secondElem") != nil {
            let intValue = defaults.integerForKey("secondElem")
            tabSet2.value = Float(intValue)
        } else {
            tabSet2.value = 20
        }
        
        if defaults.objectForKey("thirdElem") != nil {
            let intValue = defaults.integerForKey("thirdElem")
            tabSet3.value = Float(intValue)
        } else {
            tabSet3.value = 25
        }
        label1.text = String(format:"%d%%", Int(tabSet1.value))
        label2.text = String(format:"%d%%", Int(tabSet2.value))
        label3.text = String(format:"%d%%", Int(tabSet3.value))
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    @IBAction func sliderChanged(sender: UISlider) {
        if (sender == tabSet1) {
            label1.text = String(format:"%d%%", Int(tabSet1.value))
            print (Int(tabSet1.value))
            
            
            /*segment.setTitle(String(format:"%d%%", Int(tabSet1.value)), forSegmentAtIndex:0);
            */
            tipArray[0] = Int(tabSet1.value)
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(Int(tabSet1.value), forKey: String("frstElem"))
            defaults.synchronize()
        } else if (sender == tabSet2) {
            label2.text = String(format:"%d%%", Int(tabSet2.value))
            tipArray[1] = Int(tabSet2.value)
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(Int(tabSet2.value), forKey: String("secondElem"))
            defaults.synchronize()
        } else if (sender == tabSet3) {
            label3.text = String(format:"%d%%", Int(tabSet3.value))
            tipArray[2] = Int(tabSet3.value)
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(Int(tabSet3.value), forKey: String("thirdElem"))
            defaults.synchronize()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
