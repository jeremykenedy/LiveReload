import Foundation
import ATPathSpec
import PackageManagerKit

@objc(ProjectContext)
public protocol ProjectContext : NSObjectProtocol {

    var rootURL: NSURL { get }
    var path: String { get }

    var forcedStylesheetReloadSpec: ATPathSpec? { get }

    var disableLiveRefresh: Bool { get }

    func hackhack_didWriteCompiledFile(file: ProjectFile)
    func hackhack_didFilterFile(file: ProjectFile)
    func hackhack_shouldFilterFile(file: ProjectFile) -> Bool

    func displayResult(result: LROperationResult, key: String)

    func compilerActionsForFile(file: ProjectFile) -> [Action]

    func sendReloadRequest(#changes: [NSDictionary], forceFullReload: Bool)

    func rootFilesForFiles(files: [ProjectFile]) -> [ProjectFile]

    func setAnalysisInProgress(inProgress: Bool, forTask task: NSObject)

    var resolutionContext: LRPackageResolutionContext { get }

    var rubyInstanceForBuilding: RuntimeInstance { get }

}
