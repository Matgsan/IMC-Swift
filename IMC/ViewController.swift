//
//  ViewController.swift
//  IMC
//
//  Created by Matheus G Santos on 15/03/2018.
//  Copyright © 2018 Matgsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viResult: UIView!
    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
 
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: Any) {
        let formatter = NumberFormatter()
        if let weight = formatter.number(from: tfWeight.text!), let height = formatter.number(from: tfHeight.text!){
            imc = weight.doubleValue/(pow(height.doubleValue, 2))
            showResults()
        }
    }
    
    
    func showResults(){
        var result: String = ""
        var image: String = ""
        
        switch (imc) {
        case 0..<16:
            result = "Magreza"
            image = "magreza"
        case 16..<18.49:
            result = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<24.99:
            result = "Peso ideal"
            image = "ideal"
        case 25..<29.99:
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
        }
        lbResult.text = "\(Int(imc)):\(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}

