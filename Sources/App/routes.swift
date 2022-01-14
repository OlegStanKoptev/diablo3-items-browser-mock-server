import Vapor

func routes(_ app: Application) throws {
    app.get("item-type") { req -> String in
        do {
            let data = try String(contentsOf:
                URL(fileURLWithPath: app.directory.workingDirectory)
                    .appendingPathComponent("item-type.json", isDirectory: false)
            )
            return data
        } catch {
            return error.localizedDescription
        }
    }
    
    app.get("item-type", ":item-type") { req -> String in
        do {
            let itemType = req.parameters.get("item-type")!
            let data = try String(contentsOf:
                URL(fileURLWithPath: app.directory.workingDirectory)
                    .appendingPathComponent("item-type", isDirectory: true)
                    .appendingPathComponent("\(itemType).json", isDirectory: false)
            )
            return data
        } catch {
            return error.localizedDescription
        }
    }
    
    app.get("item", ":item") { req -> String in
        do {
            let item = req.parameters.get("item")!
            let data = try String(contentsOf:
                URL(fileURLWithPath: app.directory.workingDirectory)
                    .appendingPathComponent("item", isDirectory: true)
                    .appendingPathComponent("\(item).json", isDirectory: false)
            )
            return data
        } catch {
            return error.localizedDescription
        }
    }
}
