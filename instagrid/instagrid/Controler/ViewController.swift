//
//  ViewController.swift
//  instagrid
//
//  Created by Farid Benjomaa on 18/03/2021.
//

import UIKit

class ViewController: UIViewController {

    var selected = UIImage(named: "Selected")
    var layout1 = UIImage(named: "Layout 1")
    var layout2 = UIImage(named: "Layout 2")
    var layout3 = UIImage(named: "Layout 3")

    @IBOutlet weak var layoutButton1: UIButton!
    @IBOutlet weak var layoutButton2: UIButton!
    @IBOutlet weak var layoutButton3: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func layout1(_ sender: Any) {
        view4.isHidden = false
        view2.isHidden = true
        layoutButton1.setImage(selected, for: UIControl.State.normal)
        layoutButton2.setImage(layout2, for: UIControl.State.normal)
        layoutButton3.setImage(layout3, for: UIControl.State.normal)
    }
    
    @IBAction func layout2(_ sender: Any) {
        view4.isHidden = true
        view2.isHidden = false
        layoutButton1.setImage(layout1, for: UIControl.State.normal)
        layoutButton2.setImage(selected, for: UIControl.State.normal)
        layoutButton3.setImage(layout3, for: UIControl.State.normal)
    }
    
    @IBAction func layout3(_ sender: Any) {
        view4.isHidden = false
        view2.isHidden = false
        layoutButton1.setImage(layout1, for: UIControl.State.normal)
        layoutButton2.setImage(layout2, for: UIControl.State.normal)
        layoutButton3.setImage(selected, for: UIControl.State.normal)
    }
    
}

