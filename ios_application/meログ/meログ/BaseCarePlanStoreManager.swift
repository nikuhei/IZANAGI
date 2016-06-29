//
//  BaseCarePlanStoreManager.swift
//  meログ
//
//  Created by 西澤 郁平 on 2016/05/04.
//  Copyright © 2016年 ikunyan.org. All rights reserved.
//

import Foundation
import CareKit

class BaseCarePlanStoreManager: NSObject {
    
    let CarePlanStoreURL = "MeLogCarePlanStore"
    let MeLogMedicationIdentifier = "MeLogMedication"
    
    // Medication unit
    let ThermoTitle = "体温測定"
    let ThermoText = "℃"
    let ThermoInstructions = "Take once daily."
    
    let store: OCKCarePlanStore
    
    static var sharedCarePlanStoreManager = BaseCarePlanStoreManager()
    weak var delegate: BaseCarePlanStoreManagerDelegate?
    
    override init() {
        let fileManager = NSFileManager.defaultManager()
        guard let documentDirectory = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).last else {
            fatalError("*** Error: Unable to get the document directory! ***")
        }
        let storeURL = documentDirectory.URLByAppendingPathComponent(CarePlanStoreURL)
        
        if !fileManager.fileExistsAtPath(storeURL.path!) {
            try! fileManager.createDirectoryAtURL(storeURL, withIntermediateDirectories: true, attributes: nil)
        }
        store = OCKCarePlanStore(persistenceDirectoryURL: storeURL)
        
        super.init()
        
        store.delegate = self
    }
    
    func getCarePlanStore() -> OCKCarePlanStore {
        return store
    }
    
    func getMedicationIdentifier() -> String {
        return MeLogMedicationIdentifier
    }
    
    func updateView() {
        let dictionary = NSDictionary()
        
        guard let storeManager:BaseCarePlanStoreManager = self else {
            return
        }
        storeManager.delegate?.baseCarePlanStoreManager(storeManager, updateRecords: dictionary)
    }
}

extension BaseCarePlanStoreManager: OCKCarePlanStoreDelegate {
    func carePlanStore(store: OCKCarePlanStore, didReceiveUpdateOfEvent event: OCKCarePlanEvent) {
        updateView()
    }
}

protocol BaseCarePlanStoreManagerDelegate: class {
    func baseCarePlanStoreManager(manager: BaseCarePlanStoreManager, updateRecords records:NSDictionary)
}