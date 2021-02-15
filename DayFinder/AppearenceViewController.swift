//
//  AppearenceViewController.swift
//  DayFinder
//
//  Created by karlis.stekels on 02/02/2021.
//

import UIKit

class AppearenceViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func openSettingsButtonTap(_ sender: Any) {
        openSettings()
    }
    
    @IBAction func closeButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setLabelText(){
        var text = "Unable to specify UI Style"
        if self.traitCollection.userInterfaceStyle == .dark{
            text = "Dark mode is on. \n Go to settings if you would like to \nto change ti Light mode"
        }else{
            text = "Dark mode is on. \n Go to settings if you would like to \nto change ti Light mode"
        }
        textLabel.text = text
        
    }
    
    func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
                print("open: ", success)
            }
        }
    }


}// end

extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
