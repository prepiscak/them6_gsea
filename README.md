# THEM6 GSEA analysis
## About

Gene Set Enrichment Analysis (GSEA) and visualization for THEM6 project.

[Blomme, A. et al. EMBO molecular medicine, 14(3), e14764. 
**THEM6-mediated reprogramming of lipid metabolism supports treatment resistance in prostate cancer**](https://www.embopress.org/doi/full/10.15252/emmm.202114764)

## Content

Main files:
- `them6_gsea.Rmd` - R notebook with R code used for the analysis.
- `dockRstudio_v4.0.3_run.sh` - bash script to start docker Rstudio server.
- `them6_gsea_renv.lock` - [renv](https://rstudio.github.io/renv/articles/renv.html) lock file with R packages specifications.
- `generate_them6_report.sh` - bash script to generate R notebook report; it requires that Rstudio server is running (`dockRstudio_v4.0.3_run.sh`) and `new_port` used is the same in both files.

Main folders:
- `datasets` - contains input RNA-seq results datasets.
- `scripts` - contains helper functions.
- `results_dir` - contains results from the analysis.

## Usage

Clone the project repository
``` bash
git clone https://github.com/prepiscak/them6_gsea.git
```

The `them6_gsea` folder contains all the code needed to reproduce the analysis. R dependencies can be managed either using the them6 docker image (preferred; see Requirements) or `renv` lock file (`them6_gsea_renv.lock`).   

### Preferred - interactive

Start Rstudio server and generate the analysis report manually.

1. Start Rstudio server

``` bash
# new_port=7667
# username: rstudio
# password: them6
bash dockRstudio_v4.0.3_run.sh 
```

2. Go to `localhost:7666` in your browser (Chrome, Firefox). This will open Rstudio server login page where default `Username: rstudio` and `Password: them6`
3. Open project file `workspace.Rproj` and once loaded open `them6_gsea.Rmd` file. 
4. Run the `analysis_parameters` chunk to restore the R dependencies.
5. Use the `"Knit"` button to generate results and render the report and/or explore/run individual code chunks. 

:warning: `analysis_parameters` chunk (see point 4. above) needs to be run first otherwise you will get:
``` R
"Packages...not installed" 
or when using "Knit" button:
"Rendering R Markdown...requires...the following packages:..."
```

### Preferred - automatic 

Generate results and render report using `generate_them6_report.sh` script.

1. start Rstudio server

``` bash
# new_port=7667
# username: rstudio
# password: them6
bash dockRstudio_v4.0.3_run.sh 
```

2. While the Rstudio server is running execute (in a separate terminal) `generate_them6_report.sh` - this will generate the results, `them6_gsea.html` and log file (`generate_them6_report.log`).
``` bash
# new_port=7667 needs to be the same in:
#   dockRstudio_v4.0.3_run.sh and generate_them6_report.sh
bash generate_them6_report.sh
```

### Local Rstudio + renv 

1. Start local version of Rstudio
2. Open `them6_gsea.Rmd`
3. Use the `"Knit"` button to generate results and render the report and/or explore/run individual code chunks. R dependencies should be automatically restored from `them6_gsea_renv.lock` file.

## Requirements

- [Docker](https://www.docker.com/)
- [docker image for THEM6 project](https://hub.docker.com/r/prepiscak/them6-project)
