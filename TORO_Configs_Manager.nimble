# Package

version       = "0.1.0"
author        = "Marumasa"
description   = "TORO-Configs-Manager"
license       = "MIT"
srcDir        = "src"
bin           = @["TORO_Configs_Manager"]


# Dependencies

requires "nim >= 2.2.4"

# Tasks
task build, "Run tests":
    exec "nim compile --opt:speed --d:danger --gc:arc --passC:\"-flto\" --passL:\"-flto\" src/main.nim"