//
// Copyright (c) Vatsal Manot
//

@testable import SwiftDB

import XCTest

final class SwiftDBTests: XCTestCase {
    func testShitOut() {

    }
}

struct Foo: Entity {
    @Attribute var x: Int = 0
    @Attribute var y: Int = 0
}

struct Bar: Entity {
    struct V0: Entity {
        @Attribute var foo: URL? = nil
    }
    
    struct V1: Entity {
        typealias PreviousVersion = V0
        
        @Attribute var bar: URL? = nil
    }
    
    typealias PreviousVersion = V1
    typealias Parent = Foo
    
    @Attribute var x: URL? = nil
}

struct MySchema: Schema {
    var entities: Entities {
        Foo.self
        Bar.self
    }
}
