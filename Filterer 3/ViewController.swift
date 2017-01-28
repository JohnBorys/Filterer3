//
//  ViewController.swift
//  Filterer 3
//
//  Created by John Bil on 16.09.16.
//  Copyright © 2016 John Bil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet weak var bottomMenu: UIView!
    
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet var redFilterbutton: UIButton!
    
    @IBOutlet var greenFilterButton: UIButton!
    
    @IBOutlet var blueFilterButton: UIButton!
    
    @IBOutlet var yellowFilterButton: UIButton!
    
    @IBOutlet var purpuleFilterButton: UIButton!
    
    @IBOutlet var compareFilterButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        //let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        //let blurView = UIVisualEffectView(effect: blurEffect)
        //blurView.frame = secondaryMenu.bounds
        //secondaryMenu.addSubview(blurView)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onShare(_ sender: AnyObject) {
        let activityController = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    
    // NEW PHOTO
    @IBAction func onNewPhoto(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .default, handler: { action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    
    func showCamera() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        present(cameraPicker, animated: true, completion: nil)
    }
    
    
    
    func showAlbum() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .photoLibrary
        present(cameraPicker, animated: true, completion: nil)
    }
    
    
    
    // UIImagePickerController
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // Filter
    @IBAction func onFilter(_ sender: UIButton) {
        if (sender.isSelected) {
            hideSecondaryMenu()
            sender.isSelected = false
        } else {
            showSecondaryMenu()
            sender.isSelected = true
        }
    }
    
   
    @IBAction func onRedfilter(_ sender: UIButton) {
        if redFilterbutton.isSelected {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Original")
        } else {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Red")
        }
    }
    
    
    @IBAction func onGreenFilrer(_ sender: AnyObject) {
        if greenFilterButton.isSelected {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Original")
        } else {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Green")
        }
    }
    
    @IBAction func onBlueFilter(_ sender: AnyObject) {
        if blueFilterButton.isSelected {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Original")
        } else {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Blue")
        }
    }
    
    @IBAction func onYellowFilter(_ sender: AnyObject) {
        if yellowFilterButton.isSelected {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Original")
        } else {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Yellow")
        }
    }
    
    @IBAction func onPurpuleFilter(_ sender: AnyObject) {
        if purpuleFilterButton.isSelected {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Original")
        } else {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Purpule")
        }
    }
    
    
    
    
    @IBAction func onCompare(_ sender: AnyObject) {
        if compareFilterButton.isSelected {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Original")
        } else {
            imageView.image = filteredImageFunc(imageView.image!, amountCollor: 100, amountBrightness: 50, color: "Original")
        }
    }
    
    
    
    func showSecondaryMenu()  {
        view.addSubview(secondaryMenu)
        let bottomConstrain = secondaryMenu.bottomAnchor.constraint(equalTo: bottomMenu.topAnchor)
        let leftConstrain =  secondaryMenu.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConsrain = secondaryMenu.rightAnchor.constraint(equalTo: view.rightAnchor)
        let hightConstrain = secondaryMenu.heightAnchor.constraint(equalToConstant: 44)
        NSLayoutConstraint.activate([bottomConstrain, leftConstrain, rightConsrain, hightConstrain])
        view.layoutIfNeeded()
        self.secondaryMenu.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.secondaryMenu.alpha = 1.0
        }) 
    }
    
    func hideSecondaryMenu() {
        UIView.animate(withDuration: 0.5, animations: {
            self.secondaryMenu.alpha = 0
        }, completion: { completed in
            if completed == true {
                self.secondaryMenu.removeFromSuperview()
            }
        }) 
    }
    
    // Ховаєм статус бар
    override var prefersStatusBarHidden : Bool {
        return true
    }
}

