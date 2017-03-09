//
//  CalculateViewController.swift
//  tipCalculator
//
//  Created by etudiant02 on 02/03/2017.
//  Copyright © 2017 etudiant02. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBOutlet weak var checkAmountLabel: UILabel!
    
    @IBOutlet weak var checkAmountTextField: UITextField!
   
    @IBOutlet weak var button_1: UIButton!

    @IBOutlet weak var button_2: UIButton!

    @IBOutlet weak var button_3: UIButton!

    @IBOutlet weak var tip_Label: UILabel!
    
    var selectedStar1: Int = 0
    var selectedStar2: Int = 0
    var selectedStar3: Int = 0

    var brain = CalculatorModel()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.checkAmountLabel.text = "3WA test \n "
        self.checkAmountTextField.text = "$ 0,0"
//        self.segmentedControl.selectedSegmentIndex = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
        print ("le segment sélectionné est \(self.segmentedControl.selectedSegmentIndex)")
        var change:Double!

            if let amount = checkAmountTextField.text, let formattedAmount = stringToDouble (amount) {
//            brain.checkAmount = Double (amount)!
            brain.checkAmount = formattedAmount
//            print ("\(brain.serviceLevel)")
//            print ("\(brain.checkAmount)")
//            print ("\(brain.computedTip)")

                change = brain.computedTip * (self.segmentedControl.selectedSegmentIndex == 0 ? 1.0 : 1.1)
                
                self.tip_Label.text = change.toFormattedString
                self.checkAmountLabel.text = brain.serviceLabelText + " service! \n\t \(brain.tipRates[brain.serviceLevel])"
            }
            else {
                print ("Erreur : rien dans checkAmountTextField !!")
            }
    }

    @IBAction func serviceButtonTapped(_ sender: UIButton) {
        print ("button \(sender.tag)")
        brain.serviceLevel = sender.tag
        let imagePleine = #imageLiteral(resourceName: "fleche_pleine")
        let imageVide = #imageLiteral(resourceName: "fleche_creuse")
//        switch sender.tag {
//        case 0:
//            if selectedStar1 == 0 { selectedStar1 = 1
//                self.button_1.setBackgroundImage(imagePleine, for: .normal) }
//            else { selectedStar1 = 0
//                brain.serviceLevel = 0
//                self.button_1.setBackgroundImage(imageVide, for: .normal) }
//        case 1:
//            if selectedStar2 == 0 { selectedStar2 = 1
//                self.button_2.setBackgroundImage(imagePleine, for: .normal) }
//            else { selectedStar2 = 0
//                brain.serviceLevel = 0
//                self.button_2.setBackgroundImage(imageVide, for: .normal) }
//        case 2:
//            if selectedStar3 == 0 { selectedStar3 = 1
//                self.button_3.setBackgroundImage(imagePleine, for: .normal) }
//            else { selectedStar3 = 0
//                brain.serviceLevel = 0
//                self.button_3.setBackgroundImage(imageVide, for: .normal) }
//        default:
//            print ()
//        }
        self.button_1.setBackgroundImage(imagePleine, for: .normal)
        self.button_2.setBackgroundImage(sender.tag >= 1 ? imagePleine : imageVide, for: .normal)
        self.button_3.setBackgroundImage(sender.tag >= 2 ? imagePleine : imageVide, for: .normal)
        print (brain.tipLabels[brain.serviceLevel])
        print (brain.tipRates[brain.serviceLevel])
        self.checkAmountLabel.text = brain.serviceLabelText + " service! \n\t \(brain.tipRates[brain.serviceLevel])"
    }
    
    override func touchesBegan (_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
