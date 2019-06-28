Price 單一職責: 規範化所有遊戲的金錢結構 成員: 

- gold: 金，最大單位。1金可兌換1000銀
- silver: 銀，次大單位。1銀可兌換1000銅
- copper: 銅，最小單位。

接口:

- print:
    - 輸入: X
    - 輸出: 字串
    - 說明: 本程序會印出價格。
    - 隱藏細節: X
- get:
    - 輸入: X
    - 輸出: 銅
    - 說明: 本程序會回傳金銀銅三個合併計算後的數值。
    - 隱藏細節: X
- set:
    - 輸入: 銅
    - 輸出: X
    - 說明: 本程序會設定金銀銅三個單位的數值。
    - 隱藏細節: X