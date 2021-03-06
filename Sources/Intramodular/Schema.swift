//
// Copyright (c) Vatsal Manot
//

import CoreData
import Runtime
import Swallow

/// The schema of a data model.
///
/// This can loosely by considered the equivalent of an `NSManagedObjectModel`.
public protocol Schema {
    typealias Entities = [opaque_Entity.Type]
    
    var name: String { get }
    
    @ArrayBuilder<opaque_Entity.Type>
    var entities: Entities { get }
}

// MARK: - Implementation -

extension Schema {
    public var name: String {
        String(describing: type(of: self))
    }
}

// MARK: - Auxiliary Implementation -

extension NSManagedObjectModel {
    public convenience init<S: Schema>(_ schema: S) {
        self.init(SchemaDescription(schema))
    }
}
