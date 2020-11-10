-- numeric functions
--
--

function prime(n)
    for i = 2, n^(1/2) do
        if (n % i) == 0 then
            return false
        end
    end
    return true
end

local function map(f, a, ...)
    if a then
        return f(a), map(f, ...)
    end
end

local function incr(k)
    return function(a) return k > a and a or a+1 end
end

function combs(m, n)
    if m * n == 0 then return {{}} end
    local ret, old = {}, combs(m-1, n-1)
    for i = n, 1, -1 do
        for k, v in ipairs(old) do
            ret[#ret+1] = {i, map(incr(i), table.unpack(v))}
        end
    end
    return ret
end

