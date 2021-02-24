//
//  ViewController.swift
//  Instagrid
//
//  Created by Farid Benjomaa on 15/02/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    

  
    @IBOutlet var MyImageView: [UIImageView]!
    
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
    
    var tag = 0
 
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        layoutChoosePict(tappedImage)
        tag = 1
    }
    
    @objc func imageTapped2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        layoutChoosePict(tappedImage)
        tag = 2
    }
    @objc func imageTapped3(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        layoutChoosePict(tappedImage)
        tag = 3
    }
    @objc func imageTapped4(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        layoutChoosePict(tappedImage)
        tag = 4
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            let tapGestureRecognizer =  UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecognizer:)))
            let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped3(tapGestureRecognizer:)))
            let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped4(tapGestureRecognizer:)))
        
            layoutView1.isUserInteractionEnabled = true
            layoutView1.addGestureRecognizer(tapGestureRecognizer)
        
        
            layoutView2.isUserInteractionEnabled = true
            layoutView2.addGestureRecognizer(tapGestureRecognizer2)
        
            layoutView3.isUserInteractionEnabled = true
            layoutView3.addGestureRecognizer(tapGestureRecognizer3)
        
            layoutView4.isUserInteractionEnabled = true
            layoutView4.addGestureRecognizer(tapGestureRecognizer4)

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
    
    
    func setImage (tag: Int) -> UIImageView{
        let imageView = self.view.viewWithTag(tag) as! UIImageView
        imageView.image = UIImage(named:"myGraphicName")
        return imageView
    }
    
    
    
    // Fonction ajout de photos
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        
        func imageChoose(layoutview: UIImageView){
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
        
        
        switch tag {
            case 1:
                imageChoose(layoutview: layoutView1)
               
            case 2:
                imageChoose(layoutview: layoutView2)
                
            case 3:
                imageChoose(layoutview: layoutView3)
                
            case 4:
                imageChoose(layoutview: layoutView4)
                
            default:
            return
        }

        
        dismiss(animated: true, completion: nil)
            
        }

    
}

