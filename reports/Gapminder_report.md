``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.4.0      ✔ purrr   1.0.1 
    ## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
    ## ✔ tidyr   1.2.1      ✔ stringr 1.5.0 
    ## ✔ readr   2.1.3      ✔ forcats 0.5.2 
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(rstatix)
```

    ## 
    ## Attaching package: 'rstatix'
    ## 
    ## The following object is masked from 'package:stats':
    ## 
    ##     filter

This report was prepared to the attention of the United Nations. It
analyzes the relationship between a country’s GDP, its life expectancy
and CO2 emissions. Our goal is to determine to what degree a country’s
economic strength or weakness may be related to its public health status
and impact on climate pollution. We hypothesize that both life
expectancy and CO2 emissions increase with a country’s GDP.

``` r
gapminder_1997 <- read_csv("data/gapminder_1997.csv")
```

    ## Rows: 142 Columns: 5
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (2): country, continent
    ## dbl (3): pop, lifeExp, gdpPercap
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
# make plot of GDP (x-axis) vs lifeExp (y-axis)
ggplot(gapminder_1997)+
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)+
  labs(x = "GDP Per Capita", y = "Life Expectancy (Years)", title = "Relationship between Life Expectancy and GDP")+
  geom_point()+
  geom_smooth(method = "lm", se = TRUE)+
    theme_classic()+
    scale_color_brewer(palette = "Set1")
```

    ## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `linewidth` instead.

    ## `geom_smooth()` using formula = 'y ~ x'

    ## Warning in qt((1 - level)/2, df): NaNs produced

    ## Warning: The following aesthetics were dropped during statistical transformation: size
    ## ℹ This can happen when ggplot fails to infer the correct grouping structure in
    ##   the data.
    ## ℹ Did you forget to specify a `group` aesthetic or to convert a numerical
    ##   variable into a factor?

    ## Warning in max(ids, na.rm = TRUE): no non-missing arguments to max; returning
    ## -Inf

![](Gapminder_report_files/figure-markdown_github/gdp-lifeExp-1997-plot-1.png)
