import UIKit
import PlaygroundSupport

//: Simple Callback, Call function later when ready

typealias DoLaterCallback = (Double) -> Void


func doLater(callback: DoLaterCallback) {
    
    // Some intensive task that will take time to complete
    let time = 7.0
    Thread.sleep(forTimeInterval: time)
    
    callback(time)
}

doLater { (time: Double) -> Void in
    print("Reader after \(time) seconds")
}


// Create typealias for ProductCallback
typealias ProductCallback = (String) -> Void

class Merchant {
    // Define ProductCallback / Means of communication
    var productCallback: ProductCallback?
    
    init() {
    }
    
    // Action we want to call the callback on
    func sell(product: String) -> String {
        
        guard let callback = productCallback else {return product}
        
        callback(product)
        
        return product
    }
}

class Customer {
    
    init() {
        
    }
    
    // Handle Customer recieving merchant changes
    func handleMerchantProduct(product: String) -> Void {
        print(product)
    }
}

// Sender -> Product: String
let merchant = Merchant()

// Reciever -> handleMerchantProduct: (String) -> Void <-> ProductCallback

let customer = Customer()

// Set Callback
merchant.productCallback = customer.handleMerchantProduct

// Vend products
merchant.sell(product: "Apples")
merchant.sell(product: "Peaches")

//: # Examples from the iOS SDK

//: ## Animations

// Boilerplate code
let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))

let grayView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
grayView.backgroundColor = UIColor.gray
grayView.center = containerView.center
containerView.addSubview(grayView)

/*:
 
 UIView.animate takes in two closures, one before the animation starts to set it up, and another closure to be called when the animation is completed
 */
func doAnimation() {
    // A Closure/Function to handle the interpolation of values in animation
    grayView.backgroundColor = UIColor.cyan
    grayView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    grayView.transform = CGAffineTransform(rotationAngle: .pi / 2)
}

UIView.animate(withDuration: 0.45, delay: 0, options: [.autoreverse, .repeat], animations: doAnimation) { (completed) in

    // Another Closure to handle when animation is complete
}


//: ## UIKit: UIAlertController

let alertVC = UIAlertController(title: "My Title", message: "My message", preferredStyle: .actionSheet)
let alertAction = UIAlertAction(title: "Ok", style: .default) { (action) in
    // Do something to handle when action was triggered
    
}

alertVC.addAction(alertAction)



// Extra material to make this playground work
PlaygroundPage.current.liveView = containerView
PlaygroundPage.current.needsIndefiniteExecution = true
