func significantDigitsCount(_ number: Double) -> Int? {
    guard number > 0 else { return nil } // Ensuring number is positive
    
    // Convert number to string representation
    let numberString = String(number)
    
    // Remove leading and trailing zeros
    let trimmedString = numberString.trimmingCharacters(in: .whitespacesAndNewlines)
    
    // Check for scientific notation
    if let scientificRange = trimmedString.range(of: "e") {
        let baseNumber = trimmedString[..<scientificRange.lowerBound]
        return baseNumber.count
    }
    
    // Otherwise, count significant digits
    let components = trimmedString.components(separatedBy: ".")
    if components.count == 1 {
        // Whole number case
        return components.first?.count
    } else if components.count == 2 {
        // Decimal number case
        let integerPart = components[0]
        let fractionalPart = components[1]
        return integerPart.count + fractionalPart.count
    } else {
        return nil // Invalid format
    }
}

// Usage examples
let number1 = 123.45
if let significantDigits1 = significantDigitsCount(number1) {
    print("Number \(number1) has \(significantDigits1) significant digits.")
} else {
    print("Invalid number format.")
}

let number2 = 0.000123
if let significantDigits2 = significantDigitsCount(number2) {
    print("Number \(number2) has \(significantDigits2) significant digits.")
} else {
    print("Invalid number format.")
}
