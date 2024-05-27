import XCTest

final class MarkTaskDoneUITest: XCTestCase {
    
    func testExample() throws {
        let app = XCUIApplication()
        
        //Step 1: Перейти на главную
        app.launch()
        
        //Step 1.1: Создать задачу "Задача"
        app.navigationBars.buttons["Add"].tap()
        app.alerts.textFields["Enter task name..."].tap()
        app.alerts.textFields["Enter task name..."].typeText("Задача")
        app.alerts.scrollViews.otherElements.buttons["Add"].tap()
        
        //Stepe 2:Свайпнуть задачу слева направо
        app.tables.cells.element(boundBy: 0).swipeRight()
        app.tables.cells.buttons["done"].tap()
        
        //ОР: задача переместилась в Done
        XCTAssert(app.tables.cells.element(boundBy: 0).accessibilityFrame.maxY >= app.tables.otherElements["Done"].accessibilityFrame.maxY)
        

    }
}
