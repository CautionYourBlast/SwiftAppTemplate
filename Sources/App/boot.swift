import Vapor

/// Called after your application has initialized.
public func boot(_ app: Application) throws {
    let workDir = DirectoryConfig.detect().workDir
    let terminal = Terminal()
    var commandInput = CommandInput(arguments: [workDir])
    let _ = try terminal.run(SassCommand(), input: &commandInput, on: app.client().container )
    
    
}


