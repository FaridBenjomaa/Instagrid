//
//  ViewController.swift
//  Instagrid
//
//  Created by Farid Benjomaa on 15/02/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    

  
    
    let selected = UIImage(named: "Selected")
    let layout1 = UIImage(named: "Layout 1")
    let layout2 = UIImage(named: "Layout 2")
    let layout3 = UIImage(named: "Layout 3")

    @IBOutlet weak var layoutView1: UIImageView!
    @IBOutlet weak var layoutView2: UIImageView!
    @IBOutlet weak var layoutView3: UIImageView!
    @IBOutlet weak var layoutView4: UIImageView!
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var layoutButton1: UIButton!
    @IBOutlet weak var layoutButton2: UIButton!
    @IBOutlet weak var layoutButton3: UIButton!
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        layoutChoosePict(tappedImage)
 
    }
    @objc func imageTapped2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        layoutChoosePict(tappedImage)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecognizer:)))
        
            layoutView1.isUserInteractionEnabled = true
            layoutView1.addGestureRecognizer(tapGestureRecognizer)
        
        
            layoutView2.isUserInteractionEnabled = true
            layoutView2.addGestureRecognizer(tapGestureRecognizer2)

    }
    
    
    
    
   func layoutChoosePict(_ sender: UIImageView) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)

        }
    }
    
  

    
    @IBAction func layoutChoice1(_ sender: UIButton) {
        view2.isHidden = true
        view4.isHidden = false
        layoutButton1.setImage(selected, for: UIControl.State.normal)
        layoutButton2.setImage(layout2, for: UIControl.State.normal)
        layoutButton3.setImage(layout3, for: UIControl.State.normal)
        
    }
    @IBAction func layoutChoice2(_ sender: Any) {
        view2.isHidden = false
        view4.isHidden = true
        layoutButton1.setImage(layout1, for: UIControl.State.normal)
        layoutButton2.setImage(selected, for: UIControl.State.normal)
        layoutButton3.setImage(layout3, for: UIControl.State.normal)
    }
    
    @IBAction func layoutChoice3(_ sender: Any) {
        view2.isHidden = false
        view4.isHidden = false
        layoutButton1.setImage(layout1, for: UIControl.State.normal)
        layoutButton2.setImage(layout2, for: UIControl.State.normal)
        layoutButton3.setImage(selected, for: UIControl.State.normal)
    }
    
    // Fonction ajout de photos
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        
            if let imageSelect = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                layoutView1.image = imageSelect
                layoutView1.contentMode = .scaleAspectFill
                layoutView1.clipsToBounds = true
                
            }
        
            let leadingConstraint = NSLayoutConstraint(item: layoutView1!, attribute: .leading, relatedBy: .equal, toItem: layoutView1.superview, attribute: .leading, multiplier: 1, constant: 0)
            leadingConstraint.isActive = true
            
            let trailingConstraint = NSLayoutConstraint(item: layoutView1!, attribute: .trailing, relatedBy: .equal, toItem: layoutView1.superview, attribute: .trailing, multiplier: 1, constant: 0)
            trailingConstraint.isActive = true
            
            let topConstraint = NSLayoutConstraint(item: layoutView1!, attribute: .top, relatedBy: .equal, toItem: layoutView1.superview, attribute: .top, multiplier: 1, constant: 0)
            topConstraint.isActive = true
            
            let bottomConstraint = NSLayoutConstraint(item: layoutView1!, attribute: .bottom, relatedBy: .equal, toItem: layoutView1.superview, attribute: .bottom, multiplier: 1, constant: 0)
            bottomConstraint.isActive = true
      
            
            dismiss(animated: true, completion: nil)
        }
        
    
    

       
    
    
   
    
}

