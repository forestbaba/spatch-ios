//
//  PersistenceManager.swift
//  Spatch
//
//  Created by Adeoy3 on 17/07/2024.
//

import Foundation

final class PersistenceManager {
    static var main = PersistenceManager()
    
    // Inject CodablePersistence dependency
    private var codablePersistence: CodablePersistence
    
    init(codablePersistence: CodablePersistence = UserDefaultsCodablePersistence()) {
        self.codablePersistence = codablePersistence
    }
    
    var authToken: String {
        get {
            UserDefaults.standard.value(forKey: "authToken") as? String ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "authToken")
            UserDefaults.standard.synchronize()
        }
    }
    
    // New methods to save and load custom models
    func saveCustomModel<T: Codable>(_ model: T, forKey key: String) {
        codablePersistence.save(model, forKey: key)
    }
    
    func loadCustomModel<T: Codable>(forKey key: String) -> T? {
        return codablePersistence.load(forKey: key)
    }
}
