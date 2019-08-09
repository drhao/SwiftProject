var inputNumber: Int = 0

func checkPrime(withNumber textNumber: Int) -> String {
    var isPrime: Bool? = true
    
    if textNumber <= 0 {
        isPrime = nil
    } else if textNumber == 1 {
        isPrime = false
    } else {
        for i in 2..<textNumber {
            if textNumber % i == 0 {
                //not prime
                isPrime = false
            }
        }
    }

    if isPrime == true {
        return "\(textNumber) is a prime"
    } else if isPrime == false {
        return "\(textNumber) is not a prime"
    }
    else {
        return "Please enter a number greater than 1"
    }
}

checkPrime(withNumber: 22)


