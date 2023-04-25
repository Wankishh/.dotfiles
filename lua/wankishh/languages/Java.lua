local jdtls = require("jdtls")

local home_dir = "/home/ivelinov"
local  WORKSPACE_PATH = vim.fn.expand("$HOME") .. "/projects/java"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. "/" ..project_name

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true


local is_file_exist = function(path)
  local f = io.open(path, 'r')
  return f ~= nil and io.close(f)
end

local get_lombok_javaagent = function()
  local lombok_dir = home_dir..'/.m2/repository/org/projectlombok/lombok/'
  local lombok_versions = io.popen('ls -1 "' .. lombok_dir .. '" | sort -r')
  if lombok_versions ~= nil then
    local lb_i, lb_versions = 0, {}
    for lb_version in lombok_versions:lines() do
      lb_i = lb_i + 1
      lb_versions[lb_i] = lb_version
    end
    lombok_versions:close()
    if next(lb_versions) ~= nil then
      local lombok_jar = vim.fn.expand(string.format('%s%s/*.jar', lombok_dir, lb_versions[1]))
      if is_file_exist(lombok_jar) then
        return string.format('--jvm-arg=-javaagent:%s', lombok_jar)
      end
    end
  end
  return ''
end


local java = {}

java.getCmd = function()
	local cmd = {
		"jdtls",
		get_lombok_javaagent(),
		-- "-data",
		-- workspace_dir,
	}

    return cmd
end

java.cmd = java.getCmd()

java.settings = {
	java = {
		eclipse = {
			downloadSources = true,
		},
		configuration = {
			updateBuildConfiguration = "interactive",
			runtimes = {
				{
					name = "JavaSE-11",
					path = "~/.sdkman/candidates/java/11.0.2-open",
				},
				{
					name = "JavaSE-17",
					path = "~/.sdkman/candidates/java/17.0.5-amzn",
				},
				{
					name = "JavaSE-19",
					path = "~/.sdkman/candidates/java/19.0.1-amzn",
				},
			},
		},
		maven = {
			downloadSources = true,
		},
		implementationsCodeLens = {
			enabled = true,
		},
		referencesCodeLens = {
			enabled = true,
		},
		references = {
			includeDecompiledSources = true,
		},
		inlayHints = {
			parameterNames = {
				enabled = "all", -- literals, all, none
			},
		},
		format = {
			enabled = false,
			-- settings = {
				--   profile = "asdf"
				-- }
			},
		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		contentProvider = { preferred = "fernflower" },
		extendedClientCapabilities = extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	}


	java.createLspConfig = function ()

		local config = {
			cmd = java.getCmd(),
			settings = java.settings,
			init_options = {
				bundles = {}
			}
		}
		return config
	end


	return java
