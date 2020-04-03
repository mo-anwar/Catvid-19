import Foundation

// What is an optional ?
//An optional in Swift is a type that can hold either a value or no value. (Some/Nil)

// Avoid Null Pointer Excepition
// Int x;
// Console.WriteLine(x);


var x: Optional<Int> // Short Expression ?
var y: Int?

var possibleNumber = "String"
let convertedNumber = Int(possibleNumber)
//print(convertedNumber)

// nil You set an optional variable to a valueless state by assigning it the special value nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

// Forced Unwrapping Used to Ensure that the variable has value.

 if convertedNumber != nil {
//    print(convertedNumber) // Worng Defensive Use
//    print(convertedNumber!)
}

// The Right Way is To use If Let / Guard let / Nil Coalescing Operator

// Nil Coalescing Operator
//print(convertedNumber ?? 0)

// If you can declare this variable

if let actualNumber = Int(possibleNumber) {
//    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
//    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}

// Gard Let is early Exit

func sum(firstNum: Int?, secondNum: Int?) {
    guard let firstNumber = firstNum, let secondNumber = secondNum else { return }
    print(firstNumber + secondNumber)
    if secondNumber == 0 {
        print(secondNumber)
    }
    
}

func divide(firstNum: Int?, secondNum: Int?) {
    if let firstNumber = firstNum, let secondNumber = secondNum {
        print(secondNumber / firstNumber )
    } else {
            print("could not be divide integers")
    }
    print("Out of the scoop")
    // Some code
    //return
}
//
//sum(firstNum: 0, secondNum: nil)
//sum(firstNum: 0, secondNum: 1)
//
//divide(firstNum: 1, secondNum: 2)
//divide(firstNum: 1, secondNum: nil)

// Optional Chaining

class Person {
    var house: House?
}

class House {
    var bed: Bed?
}

class Bed {
    var numberOfBeds = 1
}

let john = Person()

//john.house = House()
//john.house?.bed = Bed()
//if let numberOfBeds = john.house?.bed?.numberOfBeds {
//    print(numberOfBeds)
//} else {
//    print("numberOfBeds not exit")
//}

//let johnRoomCount = john.house!.bed!.numberOfBeds

// try vs try? vs try!

enum SomeError: Error {
    case invalidNumber
}

func isEven(number: Int?) throws {
    guard let number = number else { throw SomeError.invalidNumber }
    if number.isMultiple(of: 2) {
        print("Is Even")
    } else {
        print("Is Odd")
    }
}


//do {
//    try isEven(number: nil)
//} catch {
//    print(error)
//}
//

//try! isEven(number: 5)
//try! isEven(number: nil)


//try? isEven(number: nil) // Silent Failling

//Array Access Defensive Programming
// ممكن يوقعلنا صاروخ ؟؟
var array: [Int] = [1]
//print(array[0])

// subscript overload on []
extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}
//print(array[safeIndex: 0])
if let number = array[safeIndex: 0] {
    print(number)
} else {
   print("Index Out Of range")
}






