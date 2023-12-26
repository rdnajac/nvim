--- launch.lua
-- This file contains the definition of the 'spec' function and the 'LAZY_PLUGIN_SPEC' table.
-- These are used for specifying and managing plugin configurations in Neovim.

-- LAZY_PLUGIN_SPEC is a global table that will store plugin specifications.
-- It acts as a registry for plugins that are to be loaded and configured.
LAZY_PLUGIN_SPEC = {}

--- Function to specify a plugin for lazy loading.
-- This function takes a plugin identifier (usually the path) and adds it to the LAZY_PLUGIN_SPEC table.
-- Each specified plugin will be handled by the lazy loading mechanism.
-- @param item string The unique identifier or path of the plugin to be loaded.
function spec(item)
  -- Insert the plugin specification into the LAZY_PLUGIN_SPEC table.
  -- Each entry in the table is a table with an 'import' field, holding the plugin identifier.
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
  --print("Added to LAZY_PLUGIN_SPEC: " .. item)
end

