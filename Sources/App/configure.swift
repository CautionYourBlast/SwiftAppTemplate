//
// Created by Jennifer Duong on 04/07/2018.
//

import Foundation
import Leaf
import Vapor




/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register leaf
    try services.register(LeafProvider())

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    
    /// Create a `CommandConfig` with default commands.
    var commandConfig = CommandConfig.default()
    /// Add the `CowsayCommand`.
    commandConfig.use(SassCommand(), as: "sass")
    /// Register this `CommandConfig` to services.
    services.register(commandConfig)


    let serverConfiure = NIOServerConfig.default(hostname: "0.0.0.0", port: 3001)
    services.register(serverConfiure)


}
