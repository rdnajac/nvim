function createHeaderFile(filename)
    -- Add the .h extension to the filename
    local headerFilename = filename .. ".h"

    -- Open the file in write mode
    local file = io.open(headerFilename, "w")

    -- Check if the file was successfully opened
    if file then
        -- Write the header file contents
        file:write("#ifndef _" .. filename:upper() .. "_H\n")
        file:write("#define _" .. filename:upper() .. "_H\n")
        file:write("\n")
        file:write("#endif /* _" .. filename:upper() .. "_H */\n")

        -- Close the file
        file:close()

        print("Header file created: " .. headerFilename)
    else
        print("Error: Unable to create the header file.")
    end
end

