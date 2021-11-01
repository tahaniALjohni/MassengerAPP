//
//  ViewController.swift
//  massengerApp
//
//  Created by T Aljohni on 21/03/1443 AH.
//

import UIKit

class ConversationViewController: UIViewController {
    // check to see if user is signed in using ... user defaults
       // they are, stay on the screen. If not, show the login screen
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
            if !isLoggedIn {
                // present login view controller
                
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
            }

}
}
