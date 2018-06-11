//
//  ViewController.swift
//  Schiffeversenken
//
//  Created by Francois Bertrand on 07.12.17.
//  Copyright © 2017 Francois Bertrand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var labelSlider: UISlider!
    @IBOutlet weak var shipLabel: UILabel!
    
    var model = Model()
    var content : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        content = model.getLabel()
        
        if content != nil{
            let maxValue = Float(content!.count) - 1
            labelSlider.maximumValue = maxValue
            // slider in die mitte setzten
            labelSlider.value = maxValue / 2
            shipLabel.text = content![content!.count / 2]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LabelChanger(_ sender: UISlider) {
        if content != nil {
            let idx = Int(sender.value)
            shipLabel.text = content![idx]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        let detViewController: DetailViewController = segue.destination as! DetailViewController
        let myDict = model.getDictionary()
        detViewController.shipText = myDict[shipLabel.text!]
    }


}

