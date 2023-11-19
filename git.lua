-- Made to get files using HTTPS but is intended for GITHUB file cloning/running.
-- Similar to the "pastebin" command for CC:Tweaked
local args = {...}
local url = ""

local function init()
    if args[2] == nil then
        print("Correct Syntax: git <url> [ -r, -c ] <filename>")
    end
    url = args[1]
    
    if args[2] == "-c" and args[3] ~= nil then
        local newFile = fs.open("./"..args[3], "w")
        local request = http.get(url)
        newFile.writeLine(request.readAll())
        newFile.close()
    elseif args[2] == "-r" then
        local rngNum = math.random(1,100)
        local newFile = fs.open("./tempFile"..tostring(rngNum), "w")
        local request = http.get(url)
        newFile.writeLine(request.readAll())
        newFile.close()
        shell.run("./tempFile"..tostring(rngNum))
        fs.delete("./tempFile"..tostring(rngNum))
    end
end

init()
