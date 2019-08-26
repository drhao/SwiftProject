class Person {
    var heart:Heart?
    init() {

        print("init")
    }
    
    deinit {
        print("deinit")
    }
    
    
}

class Heart {
    var person:Person?
    init() {
        
        print("init")
    }
    
    deinit {
        print("deinit")
    }
    
}

var aPerson:Person? = Person()
var aHeart:Heart? = Heart()

