//
//  SignupViewController.swift
//  FirstProject
//
//  Created by Rifluxyss on 13/02/23.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var confirmpassworderror: UILabel!
    @IBOutlet weak var passworderror: UILabel!
    @IBOutlet weak var numbererror: UILabel!
    @IBOutlet weak var emailerror: UILabel!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var mobilenumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func Restform(){
        signin . isEnabled = false
        passworderror . isHidden = false
        numbererror . isHidden = false
        emailerror . isHidden = false
        confirmpassword . isHidden = false
        
        passworderror . text = "required"
        numbererror . text = "required"
        emailerror . text = "required"
        confirmpassworderror . text = "required"
        
        email . text = ""
        mobilenumber . text = ""
        password . text = ""
        confirmpassword . text = ""
    }
   
    @IBAction func Emailchanged(_ sender: Any) {
        if let Email = email.text{
            if let errorMessage = invalidEmail(Email){
                emailerror.text = errorMessage
                emailerror.isHidden = false
            }
            else{
                emailerror . isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidEmail(_ value : String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        return nil
    }
    
    @IBAction func Mobilenumberchanged(_ sender: Any) {
        if let number = mobilenumber.text{
            if let errorMessage = invalidPhoneNumber(number){
                numbererror.text = errorMessage
                numbererror.isHidden = false
            }
            else{
                numbererror . isHidden = true
            }
        }
        checkForValidForm()
    }
    func invalidPhoneNumber(_ value : String) -> String?
    {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set)
        {
            return "Mobile Number must contains only digits"
        }
        if value . count != 10 {
            return "Mobile Number must be 10 digit in length"
        }
        return nil
        
    }
    func checkForValidForm(){
        if emailerror.isHidden && passworderror.isHidden && numbererror.isHidden{
            signin.isEnabled = true
        }
        else{
            signin.isEnabled = false
        }
    }
    
    @IBAction func Passwordchanged(_ sender: Any) {
        checkForValidForm()
    }
    @IBAction func signin(_ sender: Any) {
    }
    
}
