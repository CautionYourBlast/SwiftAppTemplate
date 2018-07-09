//
//  File.swift
//  Run
//
//  Created by Jennifer Duong on 06/07/2018.
//
import Foundation
import Sass
import Command


struct SassCommand: Command {

 var arguments: [CommandArgument] {
     return []
 }

 var options: [CommandOption] {
     return []
 }

 var help: [String] {
     return ["Swifty Sass"]
 }

 func run(using context: CommandContext) throws -> EventLoopFuture<Void> {
    let workDir = DirectoryConfig.detect().workDir
    
    let inputPath: String  = "\(workDir)Sources/App/sass/app.scss"
    let outputPath: String = "\(workDir)Public/styles/app.css"
    
    let sassCompiler = Sass(context: .file, input: inputPath, options: .init(), outputFile: outputPath)
    
    do {
        try sassCompiler.compile()
        context.console.success("\(inputPath) successfully compiled to \(outputPath)")
    } catch {
        context.console.error("\(error)")
    }
    
    return .done(on: context.container)
    
 }
}
