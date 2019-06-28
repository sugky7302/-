詞綴

- 單一職責: 生成裝備詞綴
- 成員:
    - prefix: 詞綴
    - object: 引用
- 接口:
    - getPrefix
        - 輸入: X
        - 輸出: 詞綴
        - 說明: 本程序會回傳生成好的詞綴
        - 隱藏細節: X
    - generate
        - 輸入: X
        - 輸出: X
        - 說明: 本程序會根據非固定的屬性的數值予以排序，調用資料庫獲得該屬性的詞綴，最後會拼在一起。如果數值相同，會根據優先級排序。
        - 隱藏細節: X