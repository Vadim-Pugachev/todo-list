import XCTest

final class TaskRemoveUITest: XCTestCase {

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
        
        //Stepe 2:Свайпнуть задачу справа налево
        app.tables.cells.element(boundBy: 0).swipeLeft()
        app.tables.cells.buttons["delete"].tap()

        //ОР: задача удалена
        XCTAssert(app.cells.staticTexts["Задача"].exists == false)
    }
}
