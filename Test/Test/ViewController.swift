//
//  ViewController.swift
//  Test
//
//  Created by Ray Wang on 2018-01-13.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var enterSomething: UITextField!
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //if cancel, dismiss picker
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    @IBAction func resetImage(_ sender: UIButton) {
        imageView.image = #imageLiteral(resourceName: "noImageSelected")
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //hide keyboard
        nameTextField.resignFirstResponder()
        //instantizes photo picker
        let imagePickerController = UIImagePickerController()
        //prevents taking a photo option
        imagePickerController.sourceType = .photoLibrary
        //makes photo picker delegate to be ViewController
        imagePickerController.delegate = self
        //pop up image picker view
        present(imagePickerController, animated: true, completion: nil)
    }
        //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
            //hide keyboard
            textField.resignFirstResponder()
            return true;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField{
            mealNameLabel.text = textField.text
        }
        else{
            foodLabel.text = textField.text
        }
    }
    
    //MARK: Storage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        enterSomething.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

