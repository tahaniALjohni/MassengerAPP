//
//  LoginViewController.swift
//  massengerApp
//
//  Created by T Aljohni on 21/03/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailtextfield : UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
  
    
    @IBAction func signInbtn(_ sender: UIButton) {
        Auth.auth().signIn(withEmail : emailtextfield.text!, password :  passwordtextfield.text! , completion: { authResult , error in
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(self.emailtextfield.text!)")
                    return
                }
                let user = result.user
                print("logged in user: \(user)")
           })
    }
    
    
        

    
    @IBAction func continuewithgooglebtn(_ sender: UIButton) {
    }
    
    @IBAction func continuewithfacebookbtn(_ sender: UIButton) {
    }
}

extension UIViewController {
    func showAlert(message:String){
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
}
