//
//  ViewController.swift
//  FocusTV
//
//  Created by Станислав Лемешаев on 14.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet weak var textFieldTip: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var focusGuide: UIFocusGuide!
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [textField]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        focusGuide = UIFocusGuide()
        view.addLayoutGuide(focusGuide)
        
        focusGuide.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        focusGuide.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        focusGuide.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        focusGuide.preferredFocusEnvironments = [nextButton]
        
        restoresFocusAfterTransition = false
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        let ac = UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(ac, animated: true)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        // if the user is moving towards the text field
        if context.nextFocusedView == textField {
            // tell the focus guide to redirect to the next button
            focusGuide.preferredFocusEnvironments = [nextButton]
        } else {
            // otherwise tell the focus guide to redirect to the next field
            focusGuide.preferredFocusEnvironments = [textField]
        }
    }

}

