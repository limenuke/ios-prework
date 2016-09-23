//
//  ViewController.swift
//  TipCalc
//
//  Created by Liang Rui on 9/12/16.
//  Copyright © 2016 Etcetera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var tipPct: UISegmentedControl!
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var billAmt: UITextField!
    var tipArray = [15, 20, 25]
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("frstElem") != nil {
            let intValue = defaults.integerForKey("frstElem")
            tipArray[0] = intValue
            print(String(format:"0 Set as tiparray value %d", intValue))
        } else {
            tipArray[0] = 15
            print(String("0 default value"))
        }
        
        if defaults.objectForKey("secondElem") != nil {
            let intValue = defaults.integerForKey("secondElem")
            tipArray[1] = intValue
            print(String(format:"1 Set as tiparray value %d", intValue))
        } else {
            tipArray[1] = 20
            print(String("1 default value"))
        }
        
        if defaults.objectForKey("thirdElem") != nil {
            let intValue = defaults.integerForKey("thirdElem")
            tipArray[2] = intValue
            print(String(format:"1 Set as tiparray value %d", intValue))
        } else {
            tipArray[2] = 25
            print(String("2 default value"))
        }
        print("view will appear")
        
        tipPct.setTitle(String(format:"%d%%", tipArray[0]), forSegmentAtIndex:0)
        tipPct.setTitle(String(format:"%d%%", tipArray[1]), forSegmentAtIndex:1)
        tipPct.setTitle(String(format:"%d%%", tipArray[2]), forSegmentAtIndex:2)
        print(String(format:"Set titles as %d %d %d", tipArray[0], tipArray[1], tipArray[2] ))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! SettingsViewController
        controller.segment = tipPct
        controller.tipArray = tipArray
    }

    @IBAction func onEdit(sender: AnyObject) {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        tipPct.description
        let billVal = Double(billAmt.text!) ?? 0
            
        let tipPctVal = Double(tipArray[tipPct.selectedSegmentIndex
        ]) * 0.01 * billVal
            
        let totalVal = billVal + tipPctVal
        tipValue.text =  String(format:"$%.2f", tipPctVal)
        total.text = String(format:"$%.2f",totalVal)
        
    }


}

