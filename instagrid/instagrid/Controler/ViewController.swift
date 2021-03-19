//
//  ViewController.swift
//  instagrid
//
//  Created by Farid Benjomaa on 18/03/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    // Images
    var selected = UIImage(named: "Selected")
    var layout1 = UIImage(named: "Layout 1")
    var layout2 = UIImage(named: "Layout 2")
    var layout3 = UIImage(named: "Layout 3")

    //Butons layout
    @IBOutlet weak var layoutButton1: UIButton!
    @IBOutlet weak var layoutButton2: UIButton!
    @IBOutlet weak var layoutButton3: UIButton!
    
    @IBOutlet weak var SwipeUp: UIView!
    
    @IBOutlet weak var imageChoose1: UIImageView!
    @IBOutlet weak var imageChoose2: UIImageView!
    @IBOutlet weak var imageChoose3: UIImageView!
    @IBOutlet weak var imageChoose4: UIImageView!
    
    //Vue images
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
 
    //Action des boutons layout
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
    
    var uiimage = UIImageView()
    
 
    
    override func viewDidLoad() {
        
        let tapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        
        imageChoose1.isUserInteractionEnabled = true
        imageChoose1.addGestureRecognizer(tapGestureRecognizer)
        
        imageChoose2.isUserInteractionEnabled = true
        imageChoose2.addGestureRecognizer(tapGestureRecognizer2)
        
        imageChoose3.isUserInteractionEnabled = true
        imageChoose3.addGestureRecognizer(tapGestureRecognizer3)
        
        imageChoose4.isUserInteractionEnabled = true
        imageChoose4.addGestureRecognizer(tapGestureRecognizer4)

    }

    func setGestureRecognizer() -> UIPanGestureRecognizer {
        
        var panRecognizer = UIPanGestureRecognizer()
        
        panRecognizer = UIPanGestureRecognizer (target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        panRecognizer.minimumNumberOfTouches = 1
        panRecognizer.maximumNumberOfTouches = 1
        return panRecognizer
    }

    // pour reconnaitre le touch
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        switch tapGestureRecognizer.view?.tag {
            case 1:
                uiimage = imageChoose1
            case 2:
                uiimage = imageChoose2
            case 3:
                uiimage = imageChoose3
            case 4:
                uiimage = imageChoose4
            default:
                break
        }
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        layoutChoosePict(tappedImage)
    }
    
    // fonction pour acceder a la librairie
    func layoutChoosePict(_ sender: UIImageView) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // fonction pour afficher l'image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        func imageChoose(_ layoutview: UIImageView){
            if let imageSelect = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                layoutview.image = imageSelect
                layoutview.contentMode = .scaleAspectFill
                layoutview.clipsToBounds = true
            }
            
            let leadingConstraint = NSLayoutConstraint(item: layoutview, attribute: .leading, relatedBy: .equal, toItem: layoutview.superview, attribute: .leading, multiplier: 1, constant: 0)
            leadingConstraint.isActive = true
            
            let trailingConstraint = NSLayoutConstraint(item: layoutview, attribute: .trailing, relatedBy: .equal, toItem: layoutview.superview, attribute: .trailing, multiplier: 1, constant: 0)
            trailingConstraint.isActive = true
            
            let topConstraint = NSLayoutConstraint(item: layoutview, attribute: .top, relatedBy: .equal, toItem: layoutview.superview, attribute: .top, multiplier: 1, constant: 0)
            topConstraint.isActive = true
            
            let bottomConstraint = NSLayoutConstraint(item: layoutview, attribute: .bottom, relatedBy: .equal, toItem: layoutview.superview, attribute: .bottom, multiplier: 1, constant: 0)
            bottomConstraint.isActive = true
        }
        
        imageChoose(uiimage)
        
        dismiss(animated: true, completion: nil)
    }

}

