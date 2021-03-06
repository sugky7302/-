# 程式碼撰寫規則
為了統一自己的程式碼風格，在後續維護或開發其他項目上能夠清晰明瞭，特意蒐集網路上或書籍中對程式碼格式的見解，消化吸收後規範成文，讓日後能有個憑依。要記得，程式碼風格無所謂好壞，只要所有程式碼一致，就是好風格。

## 目錄
- [通用](#1)
- [變數](#2)
- [常數](#3)
- [函數](#4)
- [類型](#5)
- [文件](#6)

## 參考
- 無瑕的程式碼：敏捷軟體開發技巧守則,  Robert C. Martin
- 編譯可讀代碼的藝術, Dustin Boswell & Trevor Foucher, 尹哲 & 鄭秀雯 譯

## 原則
### 程式碼
- 程式碼結構的好壞要用「代碼行數」、「時間複雜度」、「內存消耗」與「準確率」做比較
- 程式碼要能讓人快速理解、輕鬆維護、容易擴展
- 程式碼的寫法應當使別人理解它所需的時間最小化
- 一次只做一件事
    - 列出程式碼所做的所有任務
    - 盡量把這件任務拆分到不同的函數中
- 用自然語言描述程式碼要做什麼，把想法變成程式碼
- 把條件、循環以及其他隊控制流的改變做得越"自然"越好，運用一種方式使讀者不用停下來重讀你的代碼
- 通過提早返回(Guard Clause原則)來減少嵌套
- 把你的超長表達式拆分成更容易理解的小塊
- 總結變量:用一個短很多的名字取代一大塊代碼，例如取代條件語句
- 減少變量
- 減少中間結果
- 減少控制流變量
- 縮小變量的作用域
- 如果類別的成員變量只有少量方法用到，那就把它降格進方法內
- 把大東西拆分成小東西，彼此獨立才有作用，主要動機是數據分離
- 如果某個變量必須被某一個函數所使用，且無法改成local，可以考慮把函數變成閉包來處理
- 只寫一次的變量更好:只設置一次值的變量(或常量)使得代碼更容易理解
- 抽取不相關的子問題
- 簡化已有接口，永遠不要安於使用不理想的接口

### 註釋
- 註釋的目的是盡量幫助讀者了解得和作者一樣多
- 加入「導演評論」，記錄你對代碼有價值的見解
- 為代碼中的瑕疵寫註釋
    - NOTE: 註釋
	- TODO: 我還沒處理的事情
	- FIXME: 已知的無法運行的代碼
	- HACK: 對一個問題不得不草用的比較粗糙的解決方案
	- BUG: 危險!這裡有重要的問題
- 給常量加註釋，讓讀代碼的人有了調整這個值的指南
- 站在讀者的角度，去想像他們需要知道什麼而給予註釋
	- 意料之中的提問
	- 公布可能的陷阱
	- 全局觀註釋，例如類別之間如何交互，數據如何在整個系統中流動等等
	- 總結性註釋
- 做任何能幫助讀者更容易理解代碼的事
	- 不管你心裡想什麼，先把它寫下來
	- 讀一下這段註釋，看看有沒有什麼地方可以改進
	- 不斷改進
- 寫出言簡意賅的註釋
    - 保持緊湊
    - 避免使用不明確的代詞
    - 潤色粗糙的句子
    - 精確描述函數的行為
    - 用輸入/輸出例子來說明特別的情況
    - 聲明程式碼的意圖
    - 採用訊息含量高的詞

### 測試
- 測試應當具有可讀性，以便其他程序員可以舒服地改變或者增加測試
- 你應當選擇一組最簡單的輸入，它能完整地使用被測代碼

##<a1 id = "1"> 通用 </a1>
函數、變數、文件盡量給有描述性的命名，少用縮寫。若是要設為私有，則在名稱最前面加入下劃線，但局部變量不用加下劃線。

##<a1 id = "2"> 變數 </a1>
變數名一律小寫, 單詞之間用底線連接，參數、類別靜態或非靜態變數亦同。類別成員變數必須以一條下劃線結尾。
變數聲明請放在使用函數的上面，過去放在最上面是因為舊的IDE限制。

##<a1 id = "3"> 常數 </a1>
常數名採全大寫，單詞之間用底線連接，如：VARIABLE_TEST。

##<a1 id = "4"> 函數 </a1>
函數名採大駝峰法，比如：MyFunction，取值與設值函數則要求與參數名匹配：SetNumEntries(num_entries)。
此外，函數內若有調用函數，請將函數寫在原函數下面，並於頂端聲明。若是遇到多個函數調用同一函數，則該函數需寫在最後調用它的函數後面。
其它非常短小的內聯函式(<10行)名也可以用小寫字母, 例如. 如果你在循環中呼叫這樣的函式甚至都不用緩存其返回值, 小寫命名就可以接受.

##<a1 id = "5"> 類型 </a1>
類型、類別均使用大駝峰法，和[函數](#4)相同。若有慣用命名，則使用它。如果成員變量是函數，就按照函數的命名方式，也不用下劃線結尾。

##<a1 id = "6"> 文件 </a1>
文件名要全部小寫，單詞之間用下劃線連接，比如：new_document。