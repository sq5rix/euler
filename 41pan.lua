-- https://projecteuler.net/problem=41
--
-- We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once.
-- For example, 2143 is a 4-digit pandigital and is also prime.
--
-- What is the largest n-digit pandigital prime that exists?

require "prime"

print("pandigital primes ")
for m = 9 , 1 , -1 do
    for k, v in ipairs(combs(m, m)) do
        n = tonumber(table.concat(v))
        if prime(n) then
            print(n)

        end
    end
end

