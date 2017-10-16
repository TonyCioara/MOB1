//
//  ViewController.swift
//  delegatePractice
//
//  Created by Tony Cioara on 10/16/17.
//  Copyright © 2017 Tony Cioara. All rights reserved.
//

import UIKit

protocol ReceiverSendsData{
    func viewWasSwitched(data: String?)
}

class ReceivingVC: UIViewController, DataSentDelegate{

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var bottomTextLabel: UILabel!
    
    var delegate: ReceiverSendsData? = nil
    
    var lastEdit = "top"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func userDidEnterData(data: String) {
        if lastEdit == "top"{
            textLabel.text = data
        } else if lastEdit == "bottom" {
            bottomTextLabel.text = data
        }
    }
    
//    func userDidEnterDataBottom(data: String) {
//        bottomTextLabel.text = data
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSendingVC" {
            let sendingVC: SendingVC = segue.destination as! SendingVC
            sendingVC.delegate = self
            lastEdit = "top"
        } else if segue.identifier == "showBottomView" {
            let sendingVC2: SendingVC2 = segue.destination as! SendingVC2
            sendingVC2.delegate = self
            lastEdit = "bottom"
        }
    }
}
