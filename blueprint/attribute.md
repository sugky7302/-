Attribute : Array

需求:

- 可新增、刪除、修改數值
- 只能讀取名字和數值，其他數據只有在新增時才看得到
- 如果更改數據結構，不用動到接口

單一職責: 處理屬性新增、刪除、修改的功能

成員:

- limit: 最大數量
- message: 記錄插入屬性的狀態

接口:

- insert:
    - 輸入: 屬性名、數值、屬性可否刪除
    - 輸出: X
    - 說明: 本程序會生成一個數據結構插入到屬性表中。
    - 隱藏細節:
        - 會查詢資料庫是否有此屬性，有的話會去取資料。
        - 會根據資料庫的資料設定文字格式。
- erase:
    - 輸入: 屬性名
    - 輸出: X
    - 說明: 本程序會搜尋所有該屬性名的數據結構，並從屬性表中刪除。
    - 隱藏細節:
        - 會調用Array的刪除函數。
        - 如果輸入是整數會無動作。
- sort:
    - 輸入: X
    - 輸出: X
    - 說明: 本程序會根據屬性的優先級作排序。
    - 隱藏細節: X
- getName:
    - 輸入: 索引
    - 輸出: 屬性名
    - 說明: 本程序會回傳該索引的數據結構的屬性名，找不到會回傳nil。
    - 隱藏細節: 輸入屬性名不會有動作。
- getValue:
    - 輸入: 索引或屬性名
    - 輸出: 數值
    - 說明: 本程序會回傳該屬性所屬的數據結構的數值。
    - 隱藏細節: 找不到會回傳nil
- setValue:
    - 輸入: 索引或屬性名、數值
    - 輸出: X
    - 說明: 本程序會設定數值並修改文字格式。
    - 隱藏細節: 
        - 先查詢有無該屬性。
        - 會查詢資料庫該文字格式。
- addValue:
    - 輸入: 索引或屬性名、數值
    - 輸出: X
    - 說明: 本程序會增加數值並修改文字格式。
    - 隱藏細節: 先加總數值，再調用setValue。