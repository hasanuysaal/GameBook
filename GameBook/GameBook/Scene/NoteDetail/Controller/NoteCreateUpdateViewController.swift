//
//  NoteCreateUpdateViewController.swift
//  GameBook
//
//  Created by Hasan Uysal on 15.12.2022.
//

import UIKit

class NoteCreateUpdateViewController: BaseViewController {
    
    @IBOutlet weak var noteImageView: UIImageView!
    @IBOutlet weak var gameNameTextField: CustomTextField!
    @IBOutlet weak var noteTextView: CustomTextView!
    @IBOutlet weak var noteButton: UIButton!
    
    var viewModel: NoteCreateUpdateViewModelProtocol = NoteCreateUpdateViewModel()
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewSetup()
    }
    
    func imageViewSetup() {
        noteImageView.image = UIImage(systemName: "plus.viewfinder")
        noteImageView.tintColor = .systemRed
        noteImageView.isUserInteractionEnabled = true
        addGestureRecognizerToImage()
    }
    
    func addGestureRecognizerToImage() {
        let gR = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        noteImageView.addGestureRecognizer(gR)
    }
    
    @objc func imageViewTapped() {
        let pickerController = createImagePicker()
        present(pickerController, animated: true, completion: nil)
    }
    
    func createImagePicker() -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        return pickerController
    }
    
    @IBAction func noteButtonPressed(_ sender: Any) {
        guard let imageData = noteImageView.image?.jpegData(compressionQuality: 0.5),let gameName = gameNameTextField.text, let noteText = noteTextView.text else {
            return
        }
        viewModel.createNote(image: imageData, gameName: gameName, noteText: noteText)
        dismiss(animated: true)
    }
}

extension NoteCreateUpdateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        noteImageView.image = image
        dismiss(animated: true)
    }
}
