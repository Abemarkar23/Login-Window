//
//  File.swift
//  Q Connection
//
//  Created by Arjun Bemarkar on 11/1/18.
//  Copyright © 2018 Arjun Bemarkar. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

protocol LoginViewDelegate {
  func loginButtonTapped(username : String, password : String)
}

class LoginCredsView: UIView {
  private let usernameField = UITextField()
  private let passwordField = UITextField()
  private let loginButton = UIButton()
  private let paddingNum : CGFloat = 15
  private let spacing : CGFloat = 7
  private let loginFailedLabel = UILabel()
  private let loginFailedLabelHeight : CGFloat = 10
  var delegate : LoginViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    roundEdges(radius: 20)
    setupUsernameField()
    setupLoginButton()
    setupPasswordField()
    setupStackView()
    setupLoginFailedLabel()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func getPasswordGiven() -> String {
    return passwordField.text!
  }
  
  public func getusernameGiven() -> String {
    return usernameField.text!
  }
  
  private func setupLoginFailedLabel() {
    loginFailedLabel.text = "Enter Username Or Password"
    loginFailedLabel.textColor = .black
    loginFailedLabel.textAlignment = .center
  }
  
  private func setupStackView() {
    let stackView = UIStackView(arrangedSubviews: [loginFailedLabel, usernameField, passwordField, loginButton])
    for view in stackView.arrangedSubviews {
      view.roundEdges(radius: 5)
    }
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.layoutMargins = UIEdgeInsets(top: paddingNum, left: paddingNum, bottom: paddingNum, right: paddingNum) // top = paddingNum+20
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.spacing = spacing
    addSubview(stackView)
    stackView.anchorSize(to: self)
  }
  
  private func setupUsernameField() {
    usernameField.textColor = .black
    usernameField.backgroundColor = .white
    usernameField.layer.borderWidth = 1
    usernameField.layer.borderColor = UIColor.black.cgColor
    usernameField.textAlignment = .center
    usernameField.placeholder = "Username"
  }
  
  private func setupPasswordField() {
    passwordField.textColor = .black
    passwordField.backgroundColor = .white
    passwordField.layer.borderWidth = 1
    passwordField.layer.borderColor = UIColor.black.cgColor
    passwordField.isSecureTextEntry = true
    passwordField.textAlignment = .center
    passwordField.placeholder = "Password"
  }
  
  private func setupLoginButton() {
    loginButton.titleLabel?.text = "Log In"
    loginButton.backgroundColor = .red
    loginButton.titleLabel?.textColor = .white
    print("hello")
    loginButton.addTarget(self, action: #selector(didTouchLoginButton), for: .touchUpInside)
  }
  
  @objc func didTouchLoginButton() {
    if usernameField.text == "" || passwordField.text == "" {
      setupLoginFailedLabel()
    }
    else {
      delegate!.loginButtonTapped(username: usernameField.text!, password: passwordField.text!)
    }
  }
  
  func getCurrentViewController() -> UIViewController? {
    if let rootController = UIApplication.shared.keyWindow?.rootViewController {
      var currentController: UIViewController! = rootController
      while( currentController.presentedViewController != nil ) {
        currentController = currentController.presentedViewController
      }
      return currentController
    }
    return nil
  }
}
class myVC : UIViewController {
    
}

extension UIView {
  func shake(){
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.duration = 0.6
    animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
    layer.add(animation, forKey: "shake")
  }
}
