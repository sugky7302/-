local mt = require 'quest.core' "報到"
{
    detail_ = "向訓練營教官|cffffcc00庫拉特|r報到。",
    required_ = {"找到庫拉特"},
    demands_ = {'n005', true},
    talk_ = "唉呦！又有一個菜鳥來啦！看大爺怎麼樣好好調教你！",
    rewards_ = {"50金幣"}, 
}

function mt:on_reward()
    self.receiver_.owner_:add("黃金", 50)
end

function mt:on_timer(callback)
    if self:Near(-1793, -2991) then
        self:Update('n005')
        callback:Break()
    end
end