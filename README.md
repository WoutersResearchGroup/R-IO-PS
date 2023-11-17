# R-IO-PS
A public repository of developmental R code related to the input-output product space (IO-PS) to facilitate better decision-making regarding industrial policymaking.

## Package

### Installation
The package is available to install from CRAN
```text
install.packages(iopspackage)
library(iopspackage)
```

The package is also available to install via GitHub: https://github.com/WoutersResearchGroup/R-IO-PS
```text
devtools::install_github("WoutersResearchGroup/R-IO-PS")
library(iopspackage)
```

### Libraries Required
To successfully run the package, numerous other packages need to be installed and loaded into the library:
```text
library(openxlsx)
library(dplyr)
library(tidyr)
library(economiccomplexity)
```

### Usage
CEPII-BACI trade data is a required input (.csv). The BACI data is available at: http://www.cepii.fr/CEPII/fr/bdd_modele/presentation.asp?id=37

Full IO-PS analysis requires a value chain input (.csv). Three columns are required: 'Tier', 'Activity' and 'HSCode'.
```R
#-----Load Trade data and value chain into variables-----#
TradeDataused <- read.csv("BACI_HSXX_YXXXX_V202001.csv")
VCDataUsed <- read.csv("X_Value_Chain.csv")

#-----Run IOPS with Input Trade Data and Value Chain Mapping-----#
IOPS(
  tradeData = TradeDataused,
  GVCMapping = VCDataUsed
)
```

### Value Chain Output
Results are generated at tier, category and product level. Results are written to an Excel spreadsheet and headless CSV file named 'Combined_Results'. Each `Combined_Results' file contains the Tier Results, Product Results and Product Category Results.
```text
Combined_Results.xlsx
Combined_Results.csv
```

### Function
```R
IOPS(CountryCode = 710, tradeData, ComplexMethod = "eigenvalues", iterCompl = 20, GVCMapping = NULL, tradedigit = 6)
    """ IO-PS calculation function that writes the results to .xls and .csv
        Arguments:
            CountryCode - Type: character/integer. Any accepted ISO country code could be used, e.g. "United Kingdom", "GBR"}, "GB", "828" would all be accepted if the United Kingdom is the desired country.
            tradeData - Type: csv. Accepts any CEPII BACI trade data.
            ComplexMethod - Type: character. Methods used to calculate complexity measures. Can be any one of these methods: "fitness", "reflections" or "eigenvalues". Defaults to "eigenvalues".
            iterCompl - Type: integer. The number of iterations that the chosen complexity measure must use. Defaults to iterCompl = 20.
            GVCMapping - Type: csv. The desired value chain to be analysed. With Columns "Tiers", "Activity", and "HSCode".
            tradedigit - Type: Integer.  Indicate if the raw trade digit summation should be done on a 6- or 4-digit level. Defaults to tradedigit = 6.
    """
```

## Future Considerations
* Address the remaining deviations from the py_IO-PS package, especially maximum deviations.
* Triangulate the R-package across different packages (Python and MATLAB).
* Incorporate a CEPII API in the R code for easier, automated data access.
* Consider adding functionality to access an index of all countries and corresponding codes, simplifying the analysis process.
* Enhance the package's functionality by adding a time period parameter which allows the user to choose specific years for cross-period measures and evaluations.

## References

### Economic Complexity and Product Complexity
This package uses the economiccomplexity package available from CRAN to calculate economic complexity indices. Available at: https://pacha.dev/economiccomplexity/
