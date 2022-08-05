-- Variables
local LoadingText = {"boot/textutil","menu/os.ito","boot/atlas/utils","os/atlas/startupinfo","boot/base","loader.util","shell/","boot/ComputerType","boot/ComputerID"}
-- Functions
local function loadingTextShow()
    for i = 1,10 do
        sleep(0.001)
        print("Load: "..LoadingText[math.random(1,#LoadingText)])        
        term.setTextColor(8192)
        print("OK")
        term.setTextColor(1)
    end
end

-- Running
term.clear()
term.setCursorPos(1,1)
print("Atlas OS Booting...")
sleep(1)
loadingTextShow()
shell.run("desktop")
