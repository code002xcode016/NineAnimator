import Foundation
import UIKit
import Combine

// MARK: - Modern Concurrency and Performance Improvements

/// Protocol for view controllers that support async loading
protocol AsyncLoadable: UIViewController {
    func viewDidLoadAsync()
}

/// Modern image caching with improved performance
class ModernImageCache {
    static let shared = ModernImageCache()
    
    private let cache = NSCache<NSString, UIImage>()
    private let ioQueue = DispatchQueue(label: "image-io-queue", qos: .utility)
    
    private init() {
        cache.countLimit = 100 // Maximum 100 images
        cache.totalCostLimit = 100 * 1024 * 1024 // 100MB memory limit
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    /// Asynchronously load image with improved performance
    func loadImageAsync(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let key = url.absoluteString as NSString
        
        // Check memory cache first
        if let cachedImage = cache.object(forKey: key) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
            return
        }
        
        // Load from network or disk asynchronously
        Task {
            do {
                // Use URLSession with modern async/await
                let (data, _) = try await URLSession.shared.data(from: url)
                
                if let image = UIImage(data: data) {
                    // Cache the image
                    cache.setObject(image, forKey: key)
                    
                    await MainActor.run {
                        completion(image)
                    }
                } else {
                    await MainActor.run {
                        completion(nil)
                    }
                }
            } catch {
                await MainActor.run {
                    completion(nil)
                }
            }
        }
    }
}

/// Improved data source with modern async capabilities
class ModernCollectionViewDataSource<DataType>: NSObject, UICollectionViewDataSource {
    typealias CellConfiguration = (UICollectionView, IndexPath, DataType) -> UICollectionViewCell
    
    private var items: [DataType] = []
    private let cellIdentifier: String
    private let configureCell: CellConfiguration
    
    init(cellIdentifier: String, configureCell: @escaping CellConfiguration) {
        self.cellIdentifier = cellIdentifier
        self.configureCell = configureCell
    }
    
    func updateItems(_ newItems: [DataType]) {
        items = newItems
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        return configureCell(collectionView, indexPath, item)
    }
}

/// Modern table view data source with async capabilities
class ModernTableViewDataSource<DataType>: NSObject, UITableViewDataSource {
    typealias CellConfiguration = (UITableView, IndexPath, DataType) -> UITableViewCell
    
    private var items: [DataType] = []
    private let cellIdentifier: String
    private let configureCell: CellConfiguration
    
    init(cellIdentifier: String, configureCell: @escaping CellConfiguration) {
        self.cellIdentifier = cellIdentifier
        self.configureCell = configureCell
    }
    
    func updateItems(_ newItems: [DataType]) {
        items = newItems
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        return configureCell(tableView, indexPath, item)
    }
}

/// Modern search controller with improved performance
class ModernSearchController: UISearchController {
    private var searchDebouncer: Timer?
    
    func setSearchDebounceInterval(_ interval: TimeInterval, searchText: String, action: @escaping (String) -> Void) {
        // Cancel previous timer
        searchDebouncer?.invalidate()
        
        // Create new timer with debounce interval
        searchDebouncer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
            action(searchText)
        }
    }
}

/// Performance optimized animator
class SmoothAnimationCoordinator {
    static func animate(withDuration duration: TimeInterval = 0.3, 
                       delay: TimeInterval = 0, 
                       options: UIView.AnimationOptions = [.curveEaseOut],
                       animations: @escaping () -> Void, 
                       completion: ((Bool) -> Void)? = nil) {
        
        UIView.animate(withDuration: duration,
                      delay: delay,
                      usingSpringWithDamping: 0.8,
                      initialSpringVelocity: 0.5,
                      options: options,
                      animations: animations,
                      completion: completion)
    }
    
    /// Modern async animation API
    @MainActor
    static func animateAsync(withDuration duration: TimeInterval = 0.3,
                           delay: TimeInterval = 0,
                           options: UIView.AnimationOptions = [.curveEaseOut],
                           animations: @escaping () -> Void) async {
        await withCheckedContinuation { continuation in
            animate(withDuration: duration,
                   delay: delay,
                   options: options,
                   animations: animations) { _ in
                continuation.resume()
            }
        }
    }
}

/// Memory efficient cell registration helper
extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(ofClass cellClass: T.Type) {
        let reuseIdentifier = String(describing: cellClass)
        register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(ofClass cellClass: T.Type, for indexPath: IndexPath) -> T {
        let reuseIdentifier = String(describing: cellClass)
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(reuseIdentifier)")
        }
        return cell
    }
}

extension UITableView {
    func registerCell<T: UITableViewCell>(ofClass cellClass: T.Type) {
        let reuseIdentifier = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(ofClass cellClass: T.Type, for indexPath: IndexPath) -> T {
        let reuseIdentifier = String(describing: cellClass)
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(reuseIdentifier)")
        }
        return cell
    }
}

// MARK: - Lazy Loading and Virtual Scrolling Helpers

/// Virtualized data provider for large datasets
class VirtualizedDataProvider<T> {
    private let fullDataSet: [T]
    private let batchSize: Int
    private var loadedBatches: [Int: [T]] = [:]
    
    init(dataSet: [T], batchSize: Int = 20) {
        self.fullDataSet = dataSet
        self.batchSize = batchSize
    }
    
    func items(for batchIndex: Int) -> [T] {
        if let cachedBatch = loadedBatches[batchIndex] {
            return cachedBatch
        }
        
        let startIndex = batchIndex * batchSize
        let endIndex = min(startIndex + batchSize, fullDataSet.count)
        
        if startIndex < fullDataSet.count {
            let batch = Array(fullDataSet[startIndex..<endIndex])
            loadedBatches[batchIndex] = batch
            return batch
        }
        
        return []
    }
    
    func invalidateCache() {
        loadedBatches.removeAll()
    }
    
    var totalBatches: Int {
        return Int(ceil(Double(fullDataSet.count) / Double(batchSize)))
    }
}

/// Modern async data loader with cancellation support
class AsyncDataLoader {
    private var activeTasks: [UUID: Task<Void, Never>] = [:]
    
    func loadData<T>(withId id: UUID = UUID(), operation: @escaping () async throws -> T, 
                     completion: @escaping (Result<T, Error>) -> Void) -> UUID {
        
        // Cancel previous task with same ID if exists
        cancelTask(withId: id)
        
        let task = Task {
            do {
                let result = try await operation()
                await MainActor.run {
                    // Only call completion if task wasn't cancelled
                    if !Task.isCancelled && activeTasks[id] != nil {
                        completion(.success(result))
                    }
                }
            } catch {
                if !Task.isCancelled {
                    await MainActor.run {
                        if activeTasks[id] != nil {
                            completion(.failure(error))
                        }
                    }
                }
            }
        }
        
        activeTasks[id] = task
        return id
    }
    
    func cancelTask(withId id: UUID) {
        activeTasks[id]?.cancel()
        activeTasks.removeValue(forKey: id)
    }
    
    func cancelAllTasks() {
        activeTasks.values.forEach { $0.cancel() }
        activeTasks.removeAll()
    }
}