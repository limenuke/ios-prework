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
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func onEdit(sender: AnyObject) {
        let tipArray = [0.15, 0.20, 0.25]
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        tipPct.description
        let billVal = Double(billAmt.text!) ?? 0
            
        let tipPctVal = tipArray[tipPct.selectedSegmentIndex
        ] * billVal
            
        let totalVal = billVal + tipPctVal
        tipValue.text =  String(format:"$%.2f", tipPctVal)
        total.text = String(format:"$%.2f",totalVal)
        
    }


}

