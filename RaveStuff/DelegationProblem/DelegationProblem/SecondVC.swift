//
//  SecondVC.swift
//  DelegationProblem
//
//  Created by Yevgeniy Ivanov on 10/13/21.
//

import UIKit

protocol AppendDataDelegate {
    func addToNames(_ name: String)
}

class SecondVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var name: String = ""
    var delegate: AppendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = name
        self.textField.delegate = self

    }
    

}

extension SecondVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        delegate?.addToNames(textField.text ?? "")
        return false
    }
}
