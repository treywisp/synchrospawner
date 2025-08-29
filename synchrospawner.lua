---@diagnostic disable: undefined-global
--[[

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <https://unlicense.org>

]]

script_name("synchrospawner")
script_author("treywisp")
script_description("activation button - END")

require("lib.moonloader")

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end

    while true do wait(0)
        -- in isKeyJustPressed(VK_END) change VK_END: VK_INSERT, VK_1, VK_M and other. after VK_ - button english name
        if isKeyJustPressed(VK_END) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then
            math.randomseed(os.time() + tonumber(tostring({}):match("0x%x+"), 16))

            if isCharInAnyCar(PLAYER_PED) then
                if getDriverOfCar(storeCarCharIsInNoSave(PLAYER_PED)) == PLAYER_PED then
                    sampAddChatMessage(" Сработала антирассинхронизация. Транспорт телепортирован", 0xff6347)
                end
            end

            sampAddChatMessage(" Сработала антирассинхронизация. Вы были заспавнены [code: 2]", 0xff6347)

            wait(math.random(50, 200))
            sampSendSpawn()

            if math.random(0, 100) <= 20 then
                wait(math.random(100, 5000))
                sampSendSpawn()
                lockPlayerControl(true)
                sampAddChatMessage(" Сработала антирассинхронизация. Вы были заспавнены [code: 2]", 0xff6347)
                sampAddChatMessage(" В случае, если у вас плохое интернет-соединение, оставайтесь на месте до прогрузки интерьера", 0xff6347)
                wait(math.random(800, 1500))
            end

            lockPlayerControl(false)
        end
    end
end