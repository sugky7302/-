-- 儲存所有屬性數據

ATTRIBUTE = {
    '物理攻擊力', '法術攻擊力', '物理護甲', '法術護甲',
    '無元素傷害', '地元素傷害', '水元素傷害', '火元素傷害', '風元素傷害',
    '無元素抗性', '地元素抗性', '水元素抗性', '火元素抗性', '風元素抗性',
    '命中', '閃避', '知識', '技巧', '感知', '耐力', '精神', '急速', '精通', '幸運', '靈敏',
    '物理穿透', '法術穿透', '物理韌性', '法術韌性', '物理格擋', '法術格擋', '物理暴擊', '法術暴擊',
    '攻擊速度', '施法速度',
    '固定物理傷害', '固定法術傷害', '額外物理傷害', '額外法術傷害', '特殊物理傷害', '特殊法術傷害',
    '額外物理護甲', '額外法術護甲', '特殊物理護甲', '特殊法術護甲',
    '物理護甲%', '法術護甲%', '近戰減傷', '遠程減傷',
    '濺射傷害', '減少魔力消耗',
    '普通增傷', '菁英增傷', '稀有菁英增傷', '頭目增傷',
    '普通減傷', '菁英減傷', '稀有菁英減傷', '頭目減傷',
    '對普通降傷', '對菁英降傷','對稀有菁英降傷', '對頭目降傷',
    '無元素傷害%', '地元素傷害%', '水元素傷害%', '火元素傷害%', '風元素傷害%',
    '龍族增傷', '元素增傷', '靈魂增傷', '動物增傷', '人形增傷', '人造增傷', '惡魔增傷',
    '龍族減傷', '元素減傷', '靈魂減傷', '動物減傷', '人形減傷', '人造減傷', '惡魔減傷',
    '對龍族降傷', '對元素降傷','對靈魂降傷', '對動物降傷', '對人形降傷', '對人造降傷', '對惡魔降傷',
    '生命恢復', '魔力恢復', '移動速度',
}

ATTRIBUTE_INDEX = {}
for i, v in ipairs(ATTRIBUTE) do 
    ATTRIBUTE_INDEX[v] = i
end

ATTRIBUTE_STATE = {
    "+N 物理攻擊力", "+N 法術攻擊力", "+N 物理護甲", "+N 法術護甲",
    "+N 無元素傷害", "+N 地元素傷害", "+N 水元素傷害", "+N 火元素傷害", "+N 風元素傷害",
    "+N 無元素抗性", "+N 地元素抗性", "+N 水元素抗性", "+N 火元素抗性", "+N 風元素抗性",
    "+N 命中", "+N 閃避", "+N 知識", "+N 技巧", "+N 感知", "+N 耐力",
    "+N 精神", "+N 急速", "+N 精通", "+N 幸運", "+N 靈敏",
    "+N 物理穿透", "+N 法術穿透", "+N 物理韌性", "+N 法術韌性",
    "+N 物理格擋", "+N 法術格擋", "+N 物理暴擊", "+N 法術暴擊",
    "攻擊速度提高 N%", "施法速度提高 N%",
    "+N 固定物理傷害", "+N 固定法術傷害", "+N 額外物理傷害", "+N 額外法術傷害", "+N 特殊物理傷害", "+N 特殊法術傷害",
    "+N 額外物理護甲", "+N 額外法術護甲", "+N 特殊物理護甲", "+N 特殊法術護甲",
    "物理護甲提高 N%", "法術護甲提高 N%", "近戰攻擊造成的傷害降低 N%", "遠程攻擊造成的傷害降低 N%",
    "對100碼的敵人造成 N% 的額外傷害", "所有技能的魔力消耗降低 N%",
    "對一般生物造成的傷害提高 N%", "對菁英生物造成的傷害提高 N%", "對稀有菁英生物造成的傷害提高 N%", "對頭目生物造成的傷害提高 N%",
    "一般生物造成的傷害降低 N%", "菁英生物造成的傷害降低 N%", "稀有菁英生物造成的降低提高 N%", "頭目生物造成的傷害降低 N%",
    "對一般生物造成的傷害降低 N%", "對菁英生物造成的傷害降低 N%", "對稀有菁英生物造成的降低提高 N%", "對頭目生物造成的傷害降低 N%",
    "對無元素技能的傷害提高 N%", "對水元素技能的傷害提高 N%", "對地元素技能的傷害提高 N%",
    "對火元素技能的傷害提高 N%", "對風元素技能的傷害提高 N%",
    "對龍族生物造成的傷害提高 N%", "對元素生物造成的傷害提高 N%", "對靈魂生物造成的傷害提高 N%", "對動物造成的傷害提高 N%",
    "對人形生物造成的傷害提高 N%", "對人造生物造成的傷害提高 N%", "對惡魔生物造成的傷害提高 N%",
    "龍族生物造成的傷害降低 N%", "元素生物造成的傷害降低 N%", "靈魂生物造成的傷害降低 N%", "動物造成的傷害降低 N%",
    "人形生物造成的傷害降低 N%", "人造生物造成的傷害降低 N%", "惡魔生物造成的傷害降低 N%",
    "對龍族生物造成的傷害降低 N%", "對元素生物造成的傷害降低 N%", "對靈魂生物造成的傷害降低 N%", "對動物造成的傷害降低 N%",
    "對人形生物造成的傷害降低 N%", "對人造生物造成的傷害降低 N%", "對惡魔生物造成的傷害降低 N%",
    "恢復的生命值提高 N 點", "恢復的魔力值提高 N 點", "移動速度提高 N%",
}

ATTRIBUTE_WEIGHT = {
    0.5, 0.75, 0.5, 0.75,
    1, 1, 1, 1, 1,
    1, 1, 1, 1, 1,
    1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1,
    0.5, 0.5, 0.75, 0.75, 0.5, 0.5, 0.75, 0.75,
    0.25, 0.25,
    1, 1, 2, 2, 4, 4,
    2, 2, 4, 4,
    2, 2, 5, 5,
    0.5, 1,
    1, 2, 3, 4,
    1, 2, 3, 4,
    1, 2, 3, 4,
    3, 3, 3, 3, 3,
    5, 5, 5, 5, 5, 5, 5,
    5, 5, 5, 5, 5, 5, 5,
    5, 5, 5, 5, 5, 5, 5,
    0.016, 0.016, 0.05,
}

return ATTRIBUTE, ATTRIBUTE_INDEX, ATTRIBUTE_STATE, ATTRIBUTE_WEIGHT