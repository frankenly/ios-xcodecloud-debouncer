//
//  Debouncer.swift
//  Xcode Cloud
//
//  Created by Foodstory on 27/4/2566 BE.
//

import Foundation

class Debouncer {
    private var timer: Timer?
    private let interval: TimeInterval
    private let queue: DispatchQueue

    init(interval: TimeInterval, queue: DispatchQueue = .main) {
        self.interval = interval
        self.queue = queue
    }

    func debounce(action: @escaping () -> Void) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
            self.queue.async {
                action()
            }
        }
    }

    func cancel() {
        timer?.invalidate()
        timer = nil
    }
}
