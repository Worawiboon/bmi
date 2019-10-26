
import UIKit
//Kit แปลว่า ชุดเครื่องมือ
// UI แปลว่า User Interface ส่วนที่เกี่ยวกับการเชื่อมต่อกับผู้ใช้ เช่น ปุ่มกด เป็นต้น

// struct จะเป็นแบบ Pass by value คือ เหมือนก็อบปี้แยกกันคนละอัน แก้กับอันใดอันหนึ่งไม่มีผลกับอีกอัน
// class จะเป็นแบบ Pass by Reference เหมือนก็อบปี้แยกกันคนละอัน แก้กับอันใดอันหนึ่งจะมีผลกับอีกอัน

struct CalculateBrain {
    //var bmi: Float = 0.0 // 1 Value เก็บตัวเดียวนะ
    // ไม่ใช้แล้วนะ เพราะใช้ bmiStruct แทน
    var bmiStruct: BMI? // 3 Value เก็บสามตัวเป็นชุด (value, advice , color)
    //เครื่องหมาย ? คือ เป็นตัวแปร Optional คือ ตัวเลือกจะมีค่าหรือไม่มีค่าก็เป็นไปได้
    //ดังนั้นมันอาจจะไม่มีค่าก็ได้
    
    func getBMIValue() -> String {
        //let bmiTo1DecimalPlace = String(format: "%.1f", bmi)
        let bmiTo1DecimalPlace = String(format: "%.1f", bmiStruct?.value ?? 0.0)
        
        return bmiTo1DecimalPlace
    }
    func getAdvice() -> String {
        return bmiStruct?.advice ?? "No Advice"
        
        //if แบบย่อ
        //ตัวแปรที่ต้องการดูค่าว่ามีค่าหรือไม่ ?? ถ้าไม่มีค่าให้ใช้ค่าตรงนี้แทน
        // bmiStruct?.advice ?? "No Advice"
        //ตัวแปรที่ต้องการดูค่าว่ามีค่าหรือไม่ = bmiStruct?.advice
        //ถ
    }
    func getColor() -> UIColor {
        return bmiStruct?.color ?? #colorLiteral(red: 0.9452884793, green: 1, blue: 0.9480533004, alpha: 1)
    }
    
    mutating func calculateBMI(height:Float, weight:Float){
        // bmi ตัวที่ใช้นี้ ไม่มี var หรือ let นำหน้า คือตัวที่เป้น Global var
        // ส่วน weight กับ height คือ ตัวที่ฟังก์ชันรับค่ามาในชื่อนั้น เป็น Local var
        //bmi = weight / (height*height)
        
        let bmiValueLocal = weight / (height*height)
        
        if bmiValueLocal < 18.5 {
            bmiStruct = BMI(value: bmiValueLocal, advice: "Eat more pies!", color: #colorLiteral(red: 0.5119646788, green: 0.9607086778, blue: 1, alpha: 1))
        }else if  bmiValueLocal < 24.9{
            bmiStruct = BMI(value: bmiValueLocal, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.5744025111, green: 1, blue: 0.6283342242, alpha: 1))
        }else {
            bmiStruct = BMI(value: bmiValueLocal, advice: "Eat less pies!", color: #colorLiteral(red: 1, green: 0.4984004498, blue: 0.4786264896, alpha: 1))
        }//end else
    }//end function calculateBMI
}//end struct CalculateBrain
