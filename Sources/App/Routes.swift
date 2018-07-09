import Vapor
import Leaf


public func routes(_ router: Router) throws {

    /// GET /
    router.get() { req -> Future<View> in
        let leaf = try req.make(LeafRenderer.self)
//        return try self.view.make("welcome")
        let context = [String: String]()
        return leaf.render("welcome", context)
    }

    /// GET /hello/...
//    router.get(resource("hello", HelloController(view)))

    // response to requests to /info domain
    // with a description of the request
    router.get("info") { req in
        return req.description
    }


}
