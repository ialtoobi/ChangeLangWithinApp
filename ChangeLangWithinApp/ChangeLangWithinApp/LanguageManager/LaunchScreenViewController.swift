//
//  LaunchScreenViewController.swift
//  ChangeLangWithinApp
//
//  Created by Mohammed Altoobi on 25/07/2021.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    let logoImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.image = UIImage(named: "logo.png")
       imageView.contentMode = .scaleAspectFit
       imageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
       return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        
        logoImageViewConstraints()
        
        delay(interval: 2) {
            
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
            homeViewController.modalPresentationStyle = .overCurrentContext
            
            self.transitionVc(vc: homeViewController, duration: 0.3, type: .fromRight)

            //self.present(homeViewController, animated: true, completion: nil)
            
        }
        
    }
    
    // do not forget the `.isActive = true` after every constraint
    func logoImageViewConstraints() {
        
        logoImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
    }
    
    
    
    func delay(interval: TimeInterval, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            closure()
        }
    }
    
    func transitionVc(vc: UIViewController, duration: CFTimeInterval, type: CATransitionSubtype) {
        let customVcTransition = vc
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.push
        transition.subtype = type
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(customVcTransition, animated: false, completion: nil)
    }
}


