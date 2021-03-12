//
//  ViewController.swift
//  PhotoChooser
//
//  Created by Mike I on 11.03.2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
   
    @IBOutlet weak var img: UIImageView!
    private var image2 = UIImage()
    private var textView = UITextView()
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.frame=CGRect(x: 0, y: 50, width: 100, height: 100)
        textView.text="Twelve significant photographs in any one year is a good crop."
        textView.text+="\n -Ansel Adams"
        textView.font = .systemFont(ofSize: 18)
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        [
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 100)
        ].forEach{$0.isActive=true}
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .done, target: self, action: #selector(returnPick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "camera.fill"), style: .done, target: self, action: #selector(imagePick))
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    @objc func imagePick(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    @objc func returnPick(){
        if (img.image != nil){
            img.image = image2
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            if (img.image != nil){
                image2 = img.image!
            }
            img.image = image
        }
        dismiss(animated: true, completion: nil)
        // do something interesting here!
        
    }

}

