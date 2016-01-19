

local function init_chain(o, c)
    if c._base then init_chain(o, c._base) end
    if c.init then c.init(o) end
end


function CLASS(base)
    local c = {}
    if base then
        --for k,v in pairs(base) do
        --    c[k] = v
        --end
        c._base = base
        setmetatable(c, { __index = base })
    end

    c._mt = { __index = c }

    function c.new(o)
        o = o or {}
        setmetatable(o, c._mt)
        init_chain(o, c)
        return o
    end
    return c
end


return CLASS
