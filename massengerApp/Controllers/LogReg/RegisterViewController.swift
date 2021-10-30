//
//  RegisterViewController.swift
//  massengerApp
//
//  Created by T Aljohni on 21/03/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var firstnametextfield: UITextField!
    
    @IBOutlet weak var lastnametextfiled: UITextField!
    
    @IBOutlet weak var emailtextfiled: UITextField!
    
    @IBOutlet weak var passwordtextfiled: UITextField!
    @IBOutlet weak var accountprofile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerbtn(_ sender: UIButton) {
    }
    
   
    @IBAction func actionimage(_ sender: UIButton) {
        showPhotoAlert()
    }
    
    
    func  showPhotoAlert(){
        let alert = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {action in
            self.getPhoto(type: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {action in
            self.getPhoto(type: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func getPhoto(type : UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.editedImage] as? UIImage else{
            print("image not found")
            return
        }
        accountprofile.image = selectedImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
