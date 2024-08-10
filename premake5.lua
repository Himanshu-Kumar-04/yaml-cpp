project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "On"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	defines "YAML_CPP_STATIC_DEFINE"

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "ARM_DEBUG"
		symbols "On"
		runtime "Debug"

	filter "configurations:Release"
		defines "ARM_RELEASE"
		optimize "On"
		runtime "Release"

	filter "configurations:Dist"
		defines "ARM_DIST"
		optimize "On"
		runtime "Release"
