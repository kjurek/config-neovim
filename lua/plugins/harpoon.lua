return {
  "nvim-lua/plenary.nvim",
  {
    "ThePrimeagen/harpoon",
    --stylua: ignore
    keys = {
      { "<Leader>ja", function() require("harpoon.mark").add_file() end, desc = "Add File" },
      { "<Leader>jm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "File Menu" },
      { "<Leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "File 1" },
      { "<Leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "File 2" },
      { "<Leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "File 3" },
      { "<Leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "File 4" },
      { "<Leader>5", function() require("harpoon.ui").nav_file(5) end, desc = "File 5" },
      { "<Leader>`", function() require("harpoon.term").gotoTerminal(1) end, desc = "Open Terminal"},
    },
    opts = {
      global_settings = {
        save_on_toggle = true,
        enter_on_sendcmd = true,
        tabline = true,
      },
    },
  },
}
