local rootProject = vim.fn.getcwd()
local root_pattern = require("lspconfig.util").root_pattern

local project_root = root_pattern(".git", ".eslintrc.js")(rootProject)
local project_name = string.gsub(project_root or "", ".*/", "")


-- Is in Developsoft
if string.match(rootProject, "developsoft") then
	-- Is in mce project
	if string.match(rootProject, "mce") then
		project_name = "mce"
	end
end

local function isMceProject()
	return project_name == "mce"
end

local function getProjectRoot()
	return project_root
end

local function getProjectDebugVsCodeConfiguration()
	local path
	if isMceProject() then
		path = "/home/ivelinov/projects/developsoft/mce/src/apps/flows/.vscode/launch.json"
	else
		path =  rootProject .. "/.vscode/launch.json"
	end

	print("path: " .. path)
	return path
end


return {
	isMceProject = isMceProject,
	project_name = project_name,
	getProjectRoot = project_root,
	getProjectDebugVsCodeConfiguration = getProjectDebugVsCodeConfiguration
}
