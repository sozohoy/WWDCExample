import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            RearrangeExample(topColors: TopColors(image: UIImage(named: "Yelson1")!))
        }
    }
}
