-- A Stoneham Number
-- Problem 731
--
-- 10 decimal digits from the th digit onward.

-- https://www.davidhbailey.com/dhbtalks/dhb-vienna.pdf
-- https://math.stackexchange.com/questions/3880554/stoneham-number-expansion

require "prime"

function invert(n, len)
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

n=81*3*3
t = invert(n,100000)
s = table.concat(t,"")
print(s)
