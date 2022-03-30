# Rscript to generate them6 html report from R notebook file
base_dir <- "/home/rstudio/workspace/"

# specify renv cache
#message(system("id"))
#Sys.setenv(RENV_PATHS_CACHE = "/home/rstudio/renv_cache")
message("renv cache: ", renv:::renv_paths_cache())
#message("whoami: ", system("whoami"))
#message("pwd: ", system("pwd"))

# # 0. renv::activate
renv::activate(project = base_dir)
# FOR the first run restore environment and packages from them6_gsea_renv.lock 
#renv::restore(project = base_dir, lockfile = file.path(base_dir, "them6_gsea_renv.lock"), clean=TRUE)
# 1. restore original environment
renv::restore(project = base_dir, lockfile = file.path(base_dir, "them6_gsea_renv.lock"), prompt = FALSE)

rmarkdown::render(output_file = file.path(base_dir, "them6_gsea.html"), 
                  input = here::here("them6_gsea.Rmd"))
