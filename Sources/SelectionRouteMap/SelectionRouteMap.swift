import Module

public protocol RegionSelectionRouteMap {
    func countryAndCityModule() -> SelectionModule
}

public protocol SelectionPageModelProtocol {
    var title: String { get }
    var list: [String] { get }
}

public protocol SelectionModelProtocol {
    var startPageModel: SelectionPageModelProtocol { get }
    func nextPage(with item: String, selectedCount: Int) -> SelectionPageModelProtocol?
}

public protocol SelectionModuleInput {
    
}

public protocol SelectionModuleOutput: AnyObject {
    func selectionCompleted(items: [String])
}

public typealias SelectionModule = Module<SelectionModuleInput, SelectionModuleOutput>

typealias SelectionPageModule = Module<SelectionPageModuleInput, SelectionPageModuleOutput>

protocol SelectionPageModuleOutput: AnyObject {
    func itemSelected(item: String) -> SelectionPageModelProtocol?
    func selectionCanceled()
}

protocol SelectionPageModuleInput: AnyObject { }

public protocol SelectionModuleProtocol {
    func rootModule(model: SelectionModelProtocol) -> SelectionModule
}
