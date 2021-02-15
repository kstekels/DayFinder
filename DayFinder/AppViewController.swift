//
//  AppViewController.swift
//  DayFinder
//
//  Created by karlis.stekels on 03/02/2021.
//

import UIKit

class AppViewController: UIViewController {


    @IBOutlet var backgroundUIView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openSettingsButton(_ sender: Any) {
        openSettings()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setLabelText(){
        var text = "Unable to specify UI Style"
        if self.traitCollection.userInterfaceStyle == .dark {
            backgroundUIView.backgroundColor = UIColor.systemBackground
            text = "Dark Mode is on. \nGo to settings if you would like \nto change to Light Mode"
            
        }else{
            backgroundUIView.backgroundColor = UIColor.systemBackground
            text = "Light Mode is on. \nGo to settings if you would like \nto change to Dark Mode"
        }
        textLabel.text = text
    }
    
    func openSettings(){
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
                print("open: ", success)
            }
        }
    }

}//end

extension AppViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
