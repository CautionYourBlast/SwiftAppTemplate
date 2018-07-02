//
//  sass-watch.swift
//  App
//
//  Created by Jennifer Duong on 02/07/2018.
//

import Vapor
import Console

final class SassWatch: Command {
    public let id = "sass"
    public let help = ["Runs 'sass --watch scss:css'. Assumes a subfolder 'sass' within 'styles' folder which contains scss file."]
    public let console: ConsoleProtocol
    
    public init(console: ConsoleProtocol) {
        self.console = console
    }
    
    public func run(arguments: [String]) throws {
        console.print("🕵 watching sass")
        try console.foregroundExecute(program: "sass", arguments: ["--watch",
                                                                   "Public/styles/sass/app.scss:Public/styles/app.css"])
    }
}

extension SassWatch: ConfigInitializable {
    public convenience init(config: Config) throws {
        let console = try config.resolveConsole()
        self.init(console: console)
    }
}
