
import XCTest

final class ChantalUITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        
        //Step 1: Перейти на Главную
        app.launch()

        //Step 2: Тап по “+”
        app.navigationBars.buttons["Add"].tap()
        app.alerts.textFields["Enter task name..."].tap()
        
        //Step 2.1: Dвести название задачи
        app.alerts.textFields["Enter task name..."].typeText("Задача")
        
        //Step 2.2: Тап по кнопке добавления в алерте
        app.alerts.scrollViews.otherElements.buttons["Add"].tap()
        
        //ОР: Алерт ввода задачи закрылся. Введенная задача отображается в списке
        
        XCTAssert(app.cells.staticTexts["Задача"].exists)
        

    }
}
