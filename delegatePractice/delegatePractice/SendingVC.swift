//
//  SendingVC.swift
//  delegatePractice
//
//  Created by Tony Cioara on 10/16/17.
//  Copyright © 2017 Tony Cioara. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func userDidEnterData(data: String)
}

class SendingVC: UIViewController, ReceiverSendsData {

    var delegate: DataSentDelegate? = nil

    @IBOutlet weak var dataEntryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func viewWasSwitched(data: String?) {
        dataEntryTextField.placeholder = data
    }
    
    @IBAction func sendButton(_ sender: Any) {
        if delegate != nil {
            if dataEntryTextField != nil {
                let data = dataEntryTextField.text
                delegate?.userDidEnterData(data: data!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
