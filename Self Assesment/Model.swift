//
//  Model.swift
//  Self Assesment
//
//  Created by Hubert Daryanto on 21/03/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import Foundation
import CoreData

public class SabarItem:NSManagedObject, Identifiable {
    @NSManaged public var assessAt:Date?
    @NSManaged public var hasil:String?
}

extension SabarItem{
    static func lihathistori()-> NSFetchRequest<SabarItem> {
        let request:NSFetchRequest<SabarItem> = SabarItem.fetchRequest() as! NSFetchRequest<SabarItem>
        
        let sortDescriptor = NSSortDescriptor(key: "assessAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
