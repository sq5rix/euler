function prime(n)
    for i = 2, n^(1/2) do
        if (n % i) == 0 then
            return false
        end
    end
    return true
end

function factors( n )
    local f = {}
    for i = 1, n/2 do
        if n % i == 0 then
            f[#f+1] = i
        end
    end
    f[#f+1] = n
    return f
end

function tostr(a)
    return table.concat(a,"")
end

function prtab(a)
    print(table.concat(a,""))
end

function prtbs(a)
    print(table.concat(a,","))
end

function totab(s)
    res={}
    s:gsub('%d',function(n)res[#res+1]=tonumber(n)end)
    return res
end

function pad(a,len)
    if #a < len then
        for i = 1,len-#a do
            table.insert(a,1,0)
        end
    end
    return a
end

function collapse(r)
    while r[1]==0 and #r>1 do
        table.remove(r,1)
    end
    return r
end

-- normal sum
function sum(n,m)
    n = pad(n,#m)
    m = pad(m,#n)
    res = {}
    r = 0
    for i=#n,1,-1 do
        s = n[i] + m[i] + r
        if s > 9 then
            s = s - 10
            r = 1
        else
            r = 0
        end
        res[i] = s
    end
    if r>0 then
        table.insert(res,1,1)
    end
    collapse(n)
    collapse(m)
    return res
end

-- truncated sum
function tsum(n,m)
    n = pad(n,#m)
    m = pad(m,#n)
    res = {}
    r = 0
    for i=#n,1,-1 do
        s = n[i] + m[i] + r
        if s > 9 then
            s = s - 10
            r = 1
        else
            r = 0
        end
        res[i] = s
    end
    collapse(n)
    collapse(m)
    return res
end

function intab(e,r)
    for _,v in pairs(r) do
        if v == e then
            return true
        end
        return false
    end
end

function eq(n,m)
    n = pad(n,#m)
    m = pad(m,#n)
    r=0
    for i=1,#n do
        if n[i] ~= m[i] then
            return false
        end
    end
    collapse(n)
    collapse(m)
    return true
end

function eqz(n)
    if #n==0 then return true end
    for i=1,#n do
        if n[i] ~= 0 then
            return false
        end
    end
    return true
end

function gt(n,m)
    n = pad(n,#m)
    m = pad(m,#n)
    if eq(n,m) then
        return false
    end
    for i=1,#n do
        if n[i] < m[i] then
            return false
        end
    end
    collapse(n)
    collapse(m)
    return true
end

function lt(n,m)
    n = pad(n,#m)
    m = pad(m,#n)
    if eq(n,m) then
        return false
    end
    for i=1,#n do
        if n[i] > m[i] then
            return false
        end
    end
    collapse(n)
    collapse(m)
    return true
end

-- normal sub
function sub(n,m)
    n = pad(n,#m)
    m = pad(m,#n)
    ch=0
    if lt(n,m) then
        n,m=m,n
        ch=1
    end
    res = {}
    r = 0
    for i=#n,1,-1 do
        s = n[i] - m[i] - r
        if s < 0 then
            s = s + 10
            r = 1
        else
            r = 0
        end
        res[i] = s
    end
    collapse(res)
    collapse(n)
    collapse(m)
    if ch==1 then
        table.insert(res,1,"-")
    end
    return res
end

function mul(a,n)
    if a == 10 then
        s=n
        table.insert(s,0)
        return s
    end
    s={}
    for i=1,a do
        s=sum(s,n)
    end
    collapse(s)
    return s
end

function div(n,m)
    if eqz(n) then return 0, {} end
    n = pad(n,#m)
    m = pad(m,#n)
    if eq(n,m) then return 1, {} end
    c=0
    s=n
    repeat
        s=sub(s,m)
        c=c+1
    until s[1]~="-" and s[1]~=0
    collapse(s)
    collapse(n)
    collapse(m)
    return c, s
end


