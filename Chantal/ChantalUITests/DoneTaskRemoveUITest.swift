
import XCTest

final class DoneTaskRemoveUITest: XCTestCase {


    func testExample() throws {
        // UI tests must launch the application that they test.
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
        
        //Step 2.1: Задача переместилась в Done
        XCTAssert(app.tables.cells.element(boundBy: 0).accessibilityFrame.maxY >= app.tables.otherElements["Done"].accessibilityFrame.maxY)
        
        //Step 3: Задача удалена
        app.tables.cells.element(boundBy: 0).swipeLeft()
        app.tables.cells.buttons["delete"].tap()
        
        //ОР: Задача удалена
        XCTAssert(app.cells.staticTexts["Задача"].exists == false)
    }
}
