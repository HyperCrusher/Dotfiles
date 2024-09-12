return {
  {
    "rgroli/other.nvim",
    main = "other-nvim",
    opts = {
      mappings = {
        {
          pattern = "(.*)%.c$",
          target = "%1.h",
          context = "c"
        },
        {
          pattern = "(.*)%.cpp$",
          target = "%1.h",
          context = "c"
        },
        {
          pattern = "(.*)%.h$",
          target = {
            {
              target = "%1.c",
              context = "c"
            },
            {
              target = "%1.cpp",
              context = "cpp"
            },
          }
        }
      }
    }
  }
}
