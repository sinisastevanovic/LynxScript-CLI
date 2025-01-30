workspace "LynxScript-CLI"
    configurations { "Debug", "Release" }
    platforms { "x64" }
    startproject "LynxScript-CLI"

    flags { "MultiProcessorCompile" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        optimize "On"

project "LynxScript-CLI"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    architecture "x86_64"

    targetname "lxscript"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "bin-int/%{cfg.buildcfg}"

    links { "LynxScript.lib" }

    includedirs { "src", "include" }
    files { "src/**.h", "src/**.hpp", "src/**.cpp", "include/**.h", "include/**.hpp", "include/**.c", "include/**.cpp", "main.cpp" }