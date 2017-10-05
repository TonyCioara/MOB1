
import UIKit
import PlaygroundSupport


// Problem #1
// Modeling Data (Structs, Enums, Classes)
// We want to represent Students and Courses
// Students have a list of courses that they take
// Courses also have a list of students
// Write a function in courses that prints out the names of all the students in a course
// Write an instance of student with a list of courses and an instance of course that has a list of students
// Test out the function in course that prints out its list of students

class Course {
    
    var courseName = ""
    var studentList: [Student]
    
    init(courseName: String, studentList: [Student]) {
        self.courseName = courseName
        self.studentList = studentList
    }
    
    func printStudents() {
        for student in studentList {
            print(student.studentName)
        }
    }
}

class Student {
    
    var studentName = ""
    var courseList: [Course]
    
    init(studentName: String, courseList: [Course]) {
        self.studentName = studentName
        self.courseList = courseList
    }
    
}

var course1 = Course(courseName: "Math", studentList: [])
var student1 = Student(studentName: "Tony", courseList: [course1])

course1.studentList = [student1]

course1.printStudents()

var firstStudent = course1.studentList.first
firstStudent?.studentName = "John"


course1.printStudents()


// Problem #2
// Protocols & Modeling (Structs, Enums, Classes)
/*:
 We need to model different types of Animals in the animal kindom
 a. Animals need to have a species
 b. All Animals need to eat food
 c. Some Animals can Jump, some can Fly
 d. Create instance of 3 animals with different species, some can fly, can jump, some can fly and jump
 e. Put them in an array and print out animals than can only fly
*/

protocol CanFly {
    func fly()
}

extension CanFly {
    func fly() {
        print("I just flew!")
    }
}

protocol CanJump: class {
    func jump()
}

extension CanJump {
    func jump() {
        print("I just jumped!")
    }
}

class Animal {
    
    var species: String
    
    init (species: String) {
        self.species = species
    }
    
    func eat() {
        print("Just ate!")
    }
}

class Dog: Animal, CanJump {
    
    var name: String
    
    init(name: String) {
        self.name = name
        super.init(species: "Dog")
    }
}

class Parrot: Animal, CanFly {
    
    var name: String
    
    init(name: String) {
        self.name = name
        super.init(species: "Parrot")
    }
}

class FlyingSquirel: Animal, CanJump, CanFly{
    
    var name: String
    
    init(name: String) {
        self.name = name
        super.init(species: "FlyingSquirel")
    }
}

var dog1 = Dog(name: "Ruffles")
print(dog1.species)
dog1.jump()


// Delegates Review
/*:
 
*/


//protocol MeansOfCommunicatingBetweenSenderAndReciever {
//    func senderSent(something: String)
//}
//
//struct Sender {
//    var delegate: MeansOfCommunicatingBetweenSenderAndReciever?
//
//    func somethingHappened() {
//        //Some action I want to send
//        delegate?.senderSent(something: "Hey")
//    }
//}
//
//struct Reciever: MeansOfCommunicatingBetweenSenderAndReciever {
//
//    func senderSent(something: String) {
//        print(something)
//    }
//}

//var sender = Sender()
//let reciever = Reciever()
//
//sender.delegate = reciever
//
//sender.somethingHappened()


// Problem #3
/*
 You have a UIView called touchable view that handles a tap.
 a. Write a delegate that delegates the touch action to another view/viewcontroller (SomeViewController)
 
 b. Draw a diagram for the delegation between the TouchableView and the ViewController
*/
class TouchableView: UIView {
    
    let touchGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(tap:)))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(touchGesture)
        
    }
    
    @objc func handleTap(tap: UITapGestureRecognizer) {
        print("Tapped")
    }
}

let touchView = TouchableView(
    frame: CGRect(x: 0, y: 0, width: 100, height: 100)
)

touchView.backgroundColor = UIColor.red

// ViewController that will recieve taps
class SomeViewController: UIViewController {
    
    let touchableView = touchView
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



let vc = SomeViewController()



// Implement Delegation from problem #3


// Extra material to make playground work
PlaygroundPage.current.liveView = touchView
