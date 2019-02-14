# Login Window

A login window(UIView) made with swift 4.2 using UIKit, AudioToolbox, Foundation. this works best when it is between 200 to 300 
points. It autoresizes and vibrates itself and has red text show when there is an incorrect username or password. Made using a stack view. 
.anchor method can be found in: https://github.com/Abemarkar23/Swift-Anchors/tree/master.

## Implementing
After copying and pasting the source code to another file and implement the `LoginViewDelegate` and add the view to the view controller, make sure to set the login view's delegate to the ViewController
```swift
class FirstViewController: UIViewController, LoginViewDelegate {
  
  override func viewDidLoad() {
    let loginCredView = LoginCredsView(frame: .zero)
    super.viewDidLoad()
    view.addSubview(loginCredView)
    loginCredView.delegate = self
  }
  
  // Make Sure to include this function to conform to LoginViewDelegate and to take action 
  // once user attempts login
  func loginButtonTapped(username: String, password: String) {
    print("username: \(username)")
    print("password: \(password)")
  }
```

![alt text](https://github.com/Abemarkar23/Login-Window/blob/master/ezgif.com-gif-to-mp4.gif)


