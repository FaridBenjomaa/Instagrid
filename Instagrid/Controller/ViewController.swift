//
//  ViewController.swift
//  Instagrid
//
//  Created by Farid Benjomaa on 15/02/2021.
//

import UIKit

class ViewController: UIViewController {

    let selected = UIImage(named: "Selected")
    let layout1 = UIImage(named: "Layout 1")
    let layout2 = UIImage(named: "Layout 2")
    let layout3 = UIImage(named: "Layout 3")
   
    
    @IBOutlet weak var layoutView1: UIButton!
    @IBOutlet weak var layoutView2: UIButton!
    @IBOutlet weak var layoutView3: UIButton!
    @IBOutlet weak var layoutView4: UIButton!
    
    @IBOutlet weak var layoutButton1: UIButton!
    @IBOutlet weak var layoutButton2: UIButton!
    @IBOutlet weak var layoutButton3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    

    @IBAction func layoutChoice1(_ sender: UIButton) {
        layoutView2.isHidden = true
        layoutView4.isHidden = false
        layoutButton1.setImage(selected, for: UIControl.State.normal)
        layoutButton2.setImage(layout2, for: UIControl.State.normal)
        layoutButton3.setImage(layout3, for: UIControl.State.normal)
        
    }
    @IBAction func layoutChoice2(_ sender: Any) {
        layoutView2.isHidden = false
        layoutView4.isHidden = true
        layoutButton1.setImage(layout1, for: UIControl.State.normal)
        layoutButton2.setImage(selected, for: UIControl.State.normal)
        layoutButton3.setImage(layout3, for: UIControl.State.normal)
    }
    
    @IBAction func layoutChoice3(_ sender: Any) {
        layoutView2.isHidden = false
        layoutView4.isHidden = false
        layoutButton1.setImage(layout1, for: UIControl.State.normal)
        layoutButton2.setImage(layout2, for: UIControl.State.normal)
        layoutButton3.setImage(selected, for: UIControl.State.normal)
    }
}

