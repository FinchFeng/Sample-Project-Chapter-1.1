//
//  ManagedObject.swift
//  Moody
//
//  Created by Florian on 29/05/15.
//  Copyright (c) 2015 objc.io. All rights reserved.
//

import CoreData


protocol Managed: class, NSFetchRequestResult {//对获取结果protocol进行继承
    static var entityName: String { get }
    static var defaultSortDescriptors: [NSSortDescriptor] { get }//对排序进行影响
}


extension Managed {//默认实现
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }

    static var sortedFetchRequest: NSFetchRequest<Self> {//Fetch返回的结果
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        return request
    }
}


extension Managed where Self: NSManagedObject {//默认实现
    static var entityName: String { return entity().name!  }
}

