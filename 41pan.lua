-- https://projecteuler.net/problem=41
--
-- We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once.
-- For example, 2143 is a 4-digit pandigital and is also prime.
--
-- What is the largest n-digit pandigital prime that exists?

function prime(n)
    for i = 2, n^(1/2) do
        if (n % i) == 0 then
            return false
        end
    end
    return true
end

function map(f, a, ...)
    if a then
        return f(a), map(f, ...)
    end
end
function incr(k)
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

print("pandigital primes ")
for m = 9 , 1 , -1 do
    for k, v in ipairs(combs(m, m)) do
        n = tonumber(table.concat(v))
        if prime(n) then
            print(n)

        end
    end
end

