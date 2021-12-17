import Foundation
import UIKit


let alphabet: Dictionary<Int, String> = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9", 10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"]



func convertToHex(str: String) throws -> String {
    
    var result = ""
    
    for char in str {
        guard let asciiValue = char.asciiValue else {
            throw ConvertationError.invalidCharacter
        }
        result.append(convertToHex(number: Int(asciiValue)))
    }
    
    return result;
}


func convertToHex(number: Int) -> String {
    if (number<16) {
        return alphabet[number % 16]!;
    }
    
    var stack = Stack<String>()
    var num = number
    
    while (num != 0) {
        
       
        stack.push(alphabet[num % 16]!)
        num /= 16
    }
    
    var result = ""
    while (!stack.isEmpty) {
        result.append("\(stack.pop()!)")
    }
    
    if (result.first == "0") {
        return String(result.suffix(result.count-1))
    }
    
    return format(value: result);
}

func convertToBin(str: String) throws -> String {
    
    var result = ""
    
    for char in str {
        guard let asciiValue = char.asciiValue else {
            throw ConvertationError.invalidCharacter
        }
        result.append(convertToBin(number: Int(asciiValue)))
    }
    
    return result;
}


func convertToBin(number: Int) -> String {
    if (number<2) {
        return "\(number)";
    }
    
    var stack = Stack<String>()
    var num = number
    
    while (num != 0) {
        
       
        stack.push("\(num % 2)")
        num /= 2
    }
    
    
    
    
    var result = ""
    
    if (stack.count % 4 != 0) {
        result = String(repeating: "0", count: 4 - stack.count % 4)
    }
    
    while (!stack.isEmpty) {
        result.append("\(stack.pop()!)")
    }
    
    
    
    
    
    return format(value: result);
}


func format(value: String) -> String {
    //Space after every 4 characters
    return String(value.enumerated().map {$0 > 0 && $0 % 4 == 0  ? [" ", $1] : [$1] }.joined())
}
