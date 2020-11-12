-- A Stoneham Number
-- Problem 731
--
-- 10 decimal digits from the nth digit onward.

-- https://www.davidhbailey.com/dhbtalks/dhb-vienna.pdf
-- https://math.stackexchange.com/questions/3880554/stoneham-number-expansion

require "prime"

function invertn(n, len)
    res = {}
    s = 1
    for i = 1, len, 1 do
        m = math.floor(10*s / n)
        if m <= 0 then
            s = s * 10
            m = 0
        else
            s = 10*s - m*n
        end
        res[i]=m
    end
    return res
end

function invert(n, start, len)
    res = {}
    rem = {}
    s = {1}
    nt = totab(tostring(n))
    -- while not intab(s,rem) do
    for i=1,start+len do
        if lt(s, nt) then
            s = mul(10, s)
            m = 0
        else
            m, s = div(s, nt)
        end
        if i>=start then
            table.insert(res,1,m)
        end
    end
    return res
end

n=81
s = invert(n,1,10)
prtab(s)
s = invert(n,1,10)
prtab(s)
print(1/n)
