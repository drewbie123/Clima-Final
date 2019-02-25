//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
    func userWantsPressure(pressureOn: Bool)
}


class ChangeCityViewController: UIViewController {
    
    var delegate : ChangeCityDelegate?
    var pressureBool = true
    
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!
    
    @IBOutlet weak var pressureSwitcher: UISwitch!
    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pressureSwitcher.setOn(pressureBool, animated: true)
    }
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func pressureSwitch(_ sender: UISwitch) {
        // Send the value of choice
        delegate?.userWantsPressure(pressureOn: sender.isOn)
    }
    
    
    
    
    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
