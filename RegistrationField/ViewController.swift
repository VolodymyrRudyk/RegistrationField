//
//  ViewController.swift
//  RegistrationField
//
//  Created by Володя Рудик on 12.05.2025.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var userPasswordField: UITextField!
    @IBOutlet var userNameField: UITextField!
    @IBOutlet var forgotUserPasswordButton: UIButton!
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var loginButton: UIButton!

    private let userName = "User"
    private let userPassword = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped() {
        guard let userName = userNameField.text,
              let _ = userPasswordField.text else {
            return
        }
        
        let usernamePattern = "^[a-zA-Z ]{3,20}$"
        let isUsernameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern)
            .evaluate(with: userName)
        
        if (
            userName != self.userName || !isUsernameValid
        ) || (userPasswordField.text != self.userPassword) {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password"
            )
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as? WelcomeViewController
        welcomeVC?.welcomeMessage = userNameField.text
    } 
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameField.text = ""
            self.userPasswordField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    @IBAction func unwind(for segue: UIStoryboardSegue)
    {
        userNameField.text = ""
        userPasswordField.text = ""
    }
    
    @IBAction func forgotLoginButtonTapped(_ sender: Any) {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is \(userName) 😉"
        )
        return
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is \(userPassword) 😉"
        )
        return
    }
}

