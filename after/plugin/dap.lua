local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end
dap.configurations.java = {
  {
     -- You need to extend the classPath to list your dependencies.
     -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
    classPaths = {},

    -- -- If using multi-module projects, remove otherwise.
    -- projectName = "yourProjectName",
    --
    -- javaExec = "/path/to/your/bin/java",
    mainClass = "${file}",
    --
    -- If using the JDK9+ module system, this needs to be extended
    -- `nvim-jdtls` would automatically populate this property
    -- modulePaths = {},
    name = "Launch Current File",
    request = "launch",
    type = "java"
  },
}
