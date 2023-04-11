-- Java.lua
local jdtls = require("jdtls")

local  WORKSPACE_PATH = vim.fn.expand("$HOME") .. "/projects/java"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. "/" ..project_name
print(vim.fn.getcwd())
print("workspace_dir: " .. workspace_dir)
print("project_name: " .. project_name)

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
    cmd = {
	--
	"java", -- Or the absolute path '/path/to/java11_or_newer/bin/java'
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	"-Dosgi.bundles.defaultStartLevel=4",
	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	"-Dlog.protocol=true",
	"-Dlog.level=ALL",
	"-Xms1g",
	"--add-modules=ALL-SYSTEM",
	"--add-opens",
	"java.base/java.util=ALL-UNNAMED",
	"--add-opens",
	"java.base/java.lang=ALL-UNNAMED",
	"-jar",
	"/home/ivelinov/plugin/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
	"-configuration", "/home/ivelinov/plugin/config_linux",
	"-data", workspace_dir
    },
    settings = {
	java = {
	    -- jdt = {
	    --   ls = {
	    --     vmargs = "-XX:+UseParallelGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90 -Dsun.zip.disableMemoryMapping=true -Xmx1G -Xms100m"
	    --   }
	    -- },
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
    },
    init_options = {
	bundles = {}
    }
}
return config
