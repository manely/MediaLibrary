import Foundation

struct Float {
    var value: Double = 0.0
    
    static func + (lhs: Float, rhs: Float) -> Float {
        
        var lhs = lhs
        withUnsafePointer(to: &lhs) { pointer in
            print("The address of lhs at the first line: \(pointer)")
        }
        lhs += rhs
        withUnsafePointer(to: &lhs) { pointer in
            print("The address of lhs after += rhs: \(pointer)")
        }
        
        return lhs
    }
    
    static func += (lhs: inout Float, rhs: Float) -> Void {
        withUnsafePointer(to: &lhs) { pointer in
            print("The address of lhs at the first line of +=: \(pointer)")
        }
        
        lhs.value += rhs.value
    }
}
struct myStruct {
    var a: Int
    var s: String = "myStruct String Value"
}
extension myStruct {
    init(a: Int) {
        self.init(a: a, s: "myStruct String Value")
    }
}

func testMemoryAddress() {
    
    
    var f: Float = Float(value:5.4)
    var g = Float(value: 5.2)
    withUnsafePointer(to: &f) { pointer in
        print("The address of f before addition: \(pointer)")
    }
    withUnsafePointer(to: &g) { pointer in
        print("The address of g before addition: \(pointer)")
    }
    
    var h = f + g
    withUnsafePointer(to: &h) { pointer in
        print("The address of h after addition: \(pointer)")
    }
    
    h += f
    withUnsafePointer(to: &h) { pointer in
        print("The address of h after +=: \(pointer)")
    }
    
    
    
    
    func address(_ o: UnsafeRawPointer) -> Int {
        //    return unsafeBitCast(o, to: Int.self)
        return Int.init(bitPattern: o)
    }
    
    func addressHeap<T: AnyObject>(_ o: T) -> Int {
        return unsafeBitCast(o, to: Int.self)
    }
    
    
    
    class myClas {
        var s: String = "myClass string value"
    }
    //struct
    var struct1 = myStruct(a: 5)
    var struct2 = struct1
    print(NSString(format: "%p", address(&struct1))) // -> "0x10f1fd430\n"
    print(NSString(format: "%p", address(&struct1.a))) // -> "0x10f1fd430\n"
    print(NSString(format: "%p", address(&struct1.s))) // -> "0x10f1fd430\n"
    print(NSString(format: "%p", address(&struct2))) // -> "0x10f1fd438\n"
    print(NSString(format: "%p", address(&struct2.a))) // -> "0x10f1fd438\n"
    print(NSString(format: "%p", address(&struct2.s))) // -> "0x10f1fd438\n"
    struct1.s = "mani"
    print(NSString(format: "%p", address(&struct1.s))) // -> "0x10f1fd430\n"
    struct2.s = "mosh"
    print(NSString(format: "%p", address(&struct2.s))) // -> "0x10f1fd438\n"
    
    print("Size of myStruct: \(MemoryLayout<myStruct>.size)")
    
    //String
    var s = "A String"
    var aa = s
    print(NSString(format: "%p", address(&s))) // -> "0x10f43a430\n"
    print(NSString(format: "%p", address(&aa))) // -> "0x10f43a448\n"
    
    //Class
    var class1 = myClas()
    var class2 = class1
    print(NSString(format: "%p", addressHeap(class1))) // -> 0x7fd5c8700970
    print(NSString(format: "%p", addressHeap(class2))) // -> 0x7fd5c8700970
    print(NSString(format: "%p", address(&class1))) // -> "0x10f1fd430\n"
    print(NSString(format: "%p", address(&class2))) // -> "0x10f1fd438\n"
    print(NSString(format: "%p", address(&class1.s))) // -> "0x10f1fd430\n"
    print(NSString(format: "%p", address(&class2.s))) // -> "0x10f1fd438\n"
    class1.s = "mani"
    print(NSString(format: "%p", address(&class1.s))) // -> "0x10f1fd430\n"
    class2.s = "mosh"
    print(NSString(format: "%p", address(&class2.s))) // -> "0x10f1fd430\n"
    
    
    withUnsafePointer(to: &class1) { pointer in
        print("The address of lhs at the first line: \(pointer)")
    }
    withUnsafePointer(to: &class2) { pointer in
        print("The address of lhs at the first line: \(pointer)")
    }
    
    
    //Int
    var num1 = 55
    var num2 = num1
    print(NSString(format: "%p", address(&num1))) // -> "0x10f1fd480\n"
    print(NSString(format: "%p", address(&num2))) // -> "0x10f1fd488\n"
    
    struct myEmptyStruct {
        
    }
    
    var s1 = myEmptyStruct()
    var s2 = s1
    print(NSString(format: "%p", address(&s1))) // -> ""0xa000000000070252\n""
    print(NSString(format: "%p", address(&s2))) // -> ""0xa000000000070252\n""
    
    class myEmptyClass {
    }
    
    var c1 = myEmptyClass()
    var c2 = c1
    print(NSString(format: "%p", address(&c1))) // -> ""0xa000000000070252\n""
    print(NSString(format: "%p", address(&c2))) // -> ""0xa000000000070252\n""
    
    
}
