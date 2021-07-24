//
//  ViewController.swift
//  ChangeLangWithinApp
//
//  Created by Mohammed Altoobi on 25/07/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var changeLanguageButton : UIButton!{
        didSet{
            changeLanguageButton.layer.cornerRadius = 3.0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocaleztion()
    }
    
    func setupLocaleztion(){
        titleLabel.text = "change_language_test".localized().uppercased()
        changeLanguageButton.setTitle("change_language".localized(), for: .normal)
    }
    
    @IBAction func didTapChangeLanguge(_ sender: Any) {
        changeAppLanguage()
    }
    
    // MARK: - Change APP Language
    @objc func changeAppLanguage() {
        
        let alert = UIAlertController(title: "choose_your_languge".localized(),
                                      message: nil,
                                      preferredStyle: .actionSheet)
//
//        let titleAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.black]
//
//        let titleString = NSAttributedString(string: "choose_your_languge".localized(), attributes: titleAttributes)
//
//        alert.setValue(titleString, forKey: "attributedTitle")
        
        var title = ""
        var setLanguage: Languages!
        
        if LanguageManager.shared.currentLanguage == .en {
            title = "العربية"
            setLanguage = .ar
        } else if LanguageManager.shared.currentLanguage == .ar {
            title = "English"
            setLanguage = .en
        }
        
        let lan = UIAlertAction(title: title, style: .default, handler: { (action) -> Void in
            LanguageManager.shared.setLanguage(language: setLanguage,
                                               viewControllerFactory: { title -> UIViewController in
                // the view controller that you want to show after changing the language
                return LaunchScreenViewController()
                                                
                                                
            }) { view in
                view.transform = CGAffineTransform(scaleX: 1, y: 1)
                view.alpha = 0
            }
            
        })
        
        
        
        let cancel = UIAlertAction(title: "cancel".localized(), style: .cancel, handler: { (action) -> Void in })
        alert.addAction(lan)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}

