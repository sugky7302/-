-- 仿魔獸戰役格式的自定義任務

local setmetatable = setmetatable

local Quest, mt = {}, require 'quest.util'
setmetatable(Quest, Quest)
Quest.__index = mt

-- constants
mt.is_unique_ = false  -- 任務是否唯一
mt.can_accept_ = true  -- 可否接取任務

-- assert
local CheckQuest, IsFinished, FinishMessage, CanRepeat, UpdateMessage, UpdateDemands

-- 單一任務的子任務不能出現相同的任務怪，創建會出問題
function Quest:__call(quest_name) 
    return function(quest)
        self[quest_name] = quest

        quest.name_ = quest_name

        setmetatable(quest, self)
        return quest
    end
end

function mt:Remove()
    self.receiver_ = nil
    self.demands_ = nil
    self = nil
end

function mt:Update(id)
    CheckQuest(self, id)

    if IsFinished(self) then
        FinishMessage(self)
        CanRepeat(self)
        
        self:on_reward()
        self:Remove()
    else
        UpdateMessage(self)
    end
end

-- assert
local type, pairs, ipairs = type, pairs, ipairs

CheckQuest = function(self, id)
    if type(self.demands_[id]) == 'number' then
        self.demands_[id] = self.demands_[id] - 1

        -- 設定任務完成
        if self.demands_[id] == 0 then
            self.demands_[id] = false
        end
    elseif self.demands_[id] then -- true/false型任務，比如找到某樣物件
        self.demands_[id] = false
    end
end

IsFinished = function(self)
    for _, cnd in pairs(self.demands_) do
        if cnd then -- cnd = 數字或true，都代表還沒做完任務
            return false
        end
    end

    return true
end

-- package
local js = require 'jass_tool'

FinishMessage = function(self)
    js.ClearMessage(self.receiver_.owner_.object_)
    js.Sound("gg_snd_QuestCompleted")

    self:Announce "|cff00ff00v|r|cffffcc00完成任務"
    self:Announce("|cff999999" .. self.name_)
    self:Announce("   " .. self.talk_)

    for _, required in ipairs(self.required_) do 
        self:Announce("|cff999999- " .. required)
    end

    for _, reward in ipairs(self.rewards_) do
        self:Announce("|cffffcc00獎勵|r - " .. reward)
    end
end

CanRepeat = function(self)
    self.receiver_.quests_[self.name_] = self.is_unique_
end

UpdateMessage = function(self)
    js.ClearMessage(self.receiver_.owner_.object_)
    js.Sound("gg_snd_QuestLog")

    self:Announce "|cffff6600!|r|cffffcc00更新任務"
    self:Announce(self.name_)

    -- self是副本
    UpdateDemands(self, self.__index)
end

-- assert
local table_concat = table.concat 

UpdateDemands = function(self, parent)
    for i, cnd in ipairs(parent.demands_) do
        if type(cnd) == 'table' then
            if self.demands_[cnd[1]] == false then
                self:Announce(table_concat({"|cff999999- ", parent.requried_[i], "(", cnd[2], "/", cnd[2], ")"}))
            else
                self:Announce(table_concat({"- ", parent.required_[i], "(", (cnd[2] - self.demands_[cnd[1]]), 
                                            "/", cnd[2], ")"}))
            end
        else
            if self.demands_[cnd] == false then
                self:Announce("|cff999999- " .. parent.required_[i])
            else
                self:Announce("- " .. parent.required_[i])
            end
        end
    end
end

return Quest