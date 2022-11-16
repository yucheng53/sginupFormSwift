//
//  ViewController.swift
//  SignUpFormAssignment
//
//  Created by cheng on 11/14/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
   
    @IBOutlet weak var firstNameTextView: UITextField!
    

    @IBOutlet weak var lastNameTextView: UITextField!
    
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var streetLine1TextView: UITextField!
    
    @IBOutlet weak var phoneTextView: UITextField!
    @IBOutlet weak var streetLine2TextView: UITextField!
    
    @IBOutlet weak var cityTextView: UITextField!
    @IBOutlet weak var regionTextView: UITextField!
    @IBOutlet weak var countryTextView: UITextField!
    @IBOutlet weak var postalTextView: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var radio1Btn: UIButton!
    @IBOutlet weak var raido2Btn: UIButton!
    @IBOutlet weak var radio3Btn: UIButton!
    @IBOutlet weak var radio4Btn: UIButton!
    @IBOutlet weak var termBtn: UIButton!
    var list = ["US", "IND", "GER"]
    var countryPickerView = UIPickerView()
    var checked = false
    var radioValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextView.delegate = self
        lastNameTextView.delegate = self
        emailTextView.delegate = self
        phoneTextView.delegate = self
        streetLine1TextView.delegate = self
        streetLine2TextView.delegate = self
        cityTextView.delegate = self
        regionTextView.delegate = self
        postalTextView.delegate = self
        //firstNameTextView.becomeFirstResponder()
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        countryTextView.inputView = countryPickerView

    }
    
    
    @IBAction func sendBtnTapped(_ sender: Any) {
        if firstNameTextView.text!.isEmpty || lastNameTextView.text!.isEmpty || emailTextView.text!.isEmpty || phoneTextView.text!.isEmpty || streetLine1TextView.text!.isEmpty{
            print("Please")
            
            let alert = UIAlertController(title: "Not sending", message: "Please fill all the details", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) {(action) in
                self.dismiss(animated: false)
            }
            alert.addAction(action)
            self.present(alert, animated: false, completion: nil)
        }
        else {
            let alert2 = UIAlertController(title: "Success!", message: "Data has been sent successfully", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) {(action) in
                self.dismiss(animated: false)
            }
            alert2.addAction(action)
            self.present(alert2, animated: false, completion: nil)
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField is being edited")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField ended editing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if firstNameTextView == lastNameTextView {
            return false
        }
        else {
            return true
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextView.text = list[row]
        countryTextView.resignFirstResponder()
    }
    
    @IBAction func radio1Tapped(_ sender: Any) {
        radio1Btn.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        raido2Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radio3Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radio4Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radioValue = 1
        
    }
    
    @IBAction func radio2Tapped(_ sender: Any) {
        raido2Btn.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        radio1Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radio3Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radio4Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radioValue = 2
    }
    
    
    @IBAction func radio3Tapped(_ sender: Any) {
        radio3Btn.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        raido2Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radio1Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radio4Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radioValue = 3
    }
    
    @IBAction func radio4Tapped(_ sender: Any) {
        radio4Btn.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        raido2Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radio3Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radio1Btn.setImage(UIImage(systemName: "circle"), for: .normal)
        radioValue = 1
    }
    
    @IBAction func termBtnTapped(_ sender: Any) {
        if checked == false {
            termBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            checked = true
        } else {
            termBtn.setImage(UIImage(systemName: "square"), for: .normal)
            checked = false
        }
    }
    

}

