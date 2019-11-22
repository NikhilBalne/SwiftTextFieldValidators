//
//  ViewController.swift
//  SwiftTextFieldValidators
//
//  Created by iHub on 14/11/19.
//  Copyright © 2019 iHubTechnologiesPvtLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var validateNameTxtFld: UITextField!
    @IBOutlet var validateEmailTxtFld: UITextField!
    @IBOutlet var validatePasswordTxtFld: UITextField!
    @IBOutlet var validatePhoneTxtFld: UITextField!

    var validation = Validation()
    var alertView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func alertViewOnRightSideOfTextField() -> UIView {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 27, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(named: "errorImage")
        
        alertView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        alertView.addSubview(imageView)
        
        return alertView
    }
    
    @IBAction func validateButtonTapped(_ sender: Any) {
        
        guard let name = validateNameTxtFld.text, let email = validateEmailTxtFld.text, let password = validatePasswordTxtFld.text,
            let phone = validatePhoneTxtFld.text else {
                return
        }
        
        let isValidateName = self.validation.validateName(name: name)
        if (isValidateName == false) {
            
            validateNameTxtFld.rightViewMode = .always
            validateNameTxtFld.rightView = alertViewOnRightSideOfTextField()
        }
        
        let isValidateEmail = self.validation.validateEmailId(emailID: email)
        if (isValidateEmail == false) {
            
            validateEmailTxtFld.rightViewMode = .always
            validateEmailTxtFld.rightView = alertViewOnRightSideOfTextField()
        }
        
        let isValidatePass = self.validation.validatePassword(password: password)
        if (isValidatePass == false) {
            
            validatePasswordTxtFld.rightViewMode = .always
            validatePasswordTxtFld.rightView = alertViewOnRightSideOfTextField()
        }
        
        let isValidatePhone = self.validation.validaPhoneNumber(phoneNumber: phone)
        if (isValidatePhone == false) {
        
            validatePhoneTxtFld.rightViewMode = .always
            validatePhoneTxtFld.rightView = alertViewOnRightSideOfTextField()
        }
        
    }
    
}

extension ViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let name = validateNameTxtFld.text
        let email = validateEmailTxtFld.text
        let password = validatePasswordTxtFld.text
        let phone = validatePhoneTxtFld.text
        
        let isValidateName = self.validation.validateName(name: name!)
        
        if validateNameTxtFld .isFirstResponder {
            
            if (isValidateName == false) {
                validateNameTxtFld.rightViewMode = .always
                validateNameTxtFld.rightView = alertViewOnRightSideOfTextField()
            }else{
                validateNameTxtFld.rightViewMode = .never
            }
            
        }
        
        
        let isValidateEmail = self.validation.validateEmailId(emailID: email!)
        
        if validateEmailTxtFld.isFirstResponder{
            
            if (isValidateEmail == false) {
                validateEmailTxtFld.rightViewMode = .always
                validateEmailTxtFld.rightView = alertViewOnRightSideOfTextField()
            }else{
                validateEmailTxtFld.rightViewMode = .never
            }

        }
        
        let isValidatePass = self.validation.validatePassword(password: password!)
        
        if validatePasswordTxtFld.isFirstResponder{
            
            if (isValidatePass == false) {
                
                validatePasswordTxtFld.rightViewMode = .always
                validatePasswordTxtFld.rightView = alertViewOnRightSideOfTextField()
            }else{
                validatePasswordTxtFld.rightViewMode = .never
            }
        }
        
        if validatePhoneTxtFld.isFirstResponder{
            
            let isValidatePhone = self.validation.validaPhoneNumber(phoneNumber: phone!)
            if (isValidatePhone == false) {
                
                validatePhoneTxtFld.rightViewMode = .always
                validatePhoneTxtFld.rightView = alertViewOnRightSideOfTextField()
            }else{
                validatePhoneTxtFld.rightViewMode = .never
            }
        }
        
        return true
    }
    
}
