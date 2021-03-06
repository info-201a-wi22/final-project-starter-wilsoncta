---
title: "Project Report"
author: "Aarav Vishesh Dewangan"
date: "08/03/2022"
output: html_document
---




## Research Questions:

In our project, we hope to deal with following questions:

-   How has global surface temperature, CO2 level, and natural disasters changed in the past few years
-   What are the trends for these variables?
-   What is the most common type of natural disaster globally?
-   How does the most common type of natural disaster change for different countries?

The importance of these research questions are motivated by the need to see the natural occurrences that are impacted globally by climate change. Climate change has been harming our climate at an alarming rate for many years. The purpose of these research questions is to research climate change holistically by looking at several variables commonly associated with climate change such as surface temperature, CO2 levels, and natural disasters. We also plan to analyze our data to see how exactly certain regions are most impacted by climate change. If we can identify these patterns, we can see other key factors that may be contributing to climate change in order to get a bigger picture of what we can expect in the future. Ultimately, for any researcher or concerned party that wants to help protect our planet, by compiling these research questions and data points, we can identify preventative measures to decrease the impact of climate change in the future. The topic specifically relating to natural disasters due to the topic of climate change is crucial to help understand the levels of increasing global surface temperatures and CO2 that cause additional disasters if we want to have a future planet at all.

## Data Set:

-   [Carbon dioxide in last 80 years](https://www.kaggle.com/ucsandiego/carbon-dioxide)

    -   This data set will answer the question about the cause of climate change by analyzing the change of carbon dioxide level in the atmosphere over the time and how it is related to the temperature of the Earth.

    -   This data set has 7 columns and 720 rows.

    -   The carbon dioxide data was collected and published by the University of California's Scripps Institution of Oceanography.

    -   Data provided in this section is collected in an area called the "keeling curve" also known as the world's largest unbroken record of atmospheric carbon dioxide conditions.

-   [Climate temperature in last 2 centuries](https://www.kaggle.com/berkeleyearth/climate-change-earth-surface-temperature-data)

    -   This data set can be used to answer how severe the climate change is and whether or not climate change is affecting our planet. It also demonstrates the change of surface temperature over time, which helps us answer the question of how likely climate change will affect our lives (food supply,melting ice, etc...).

    -   This data set has 5 data files, with 4-9 columns and 3176 to roughly 8.6 millions rows.

    -   This data set is created by The Berkeley Earth Surface Temperature Study by combining 1.6 billion temperature reports from 16 pre-existing archives.

-   [Natural disasters in last 2 centuries](https://www.kaggle.com/brsdincer/all-natural-disasters-19002021-eosdis)

    -   This data set can be used to answer the impacts of climate change and how the climate change affected the frequency of natural disasters. By analyzing the pattern of natural events in the last 2 decades and compare it to the rate of climate change in the last 20 years, we can solve the relationship between climate change and catastrophic natural events.

    -   This data set has 2 data files, each has 14k-16k rows and 45 columns of data.

    -   The data set is composed and published by EOSDIS SYSTEM.

## Findings

We found that for all of the variables we researched--global surface temperature, CO2 levels, and natural disasters--, all have been increasing in recent years towards a positive trend.

For CO2 levels, we found that there has been a steady incline since 1975. On page 2 of the shiny application, our group found that from 1975 to 2017, the max CO2 level of the year was **331.15** ppm and **406.36** ppm respectively. This is an increase of **75.21** ppm within a span of 42 years.

For average global surface temperature, we found there was also an upward trend. However, it must be noted for average global surface temperature, there was a dip between 1958 to 1976 with the lowest average global surface temperature at **8.34C** in 1976, decreasing from 8.77C in 1958. However, since 1976, there has been a significant increase in global surface temperature. In 2018, the most recent year in our data set, the average global surface temperature is **9.83C**, an increase of **1.49C** since 1976.

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png)

Nuanced analysis must also be provided for natural disasters. On page 3 of the shiny application, we found that there was a significant increase in natural disaster count since the 1950s with it peaking near the early 2000s. However, since the 2000s, the count of natural disasters has been trending downwards, although it is still significantly higher than at the beginning of our data set in the 1900s. We also found that in 2018, the type of natural disaster with the most occurrences in 2018 globally was **drought**.

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png)

As for the trend for types of natural disasters, we found on page 3 of the shiny application that in the United States, for example, the top three most common types of natural disasters were **droughts, earthquakes, and extreme temperatures**. However for a different country such as Indonesia, the most common types were **earthquakes, floods, and landslides**.

## Discussion

The trends revealed by our data analysis reveals an insidious and dangerous pattern which will impact climate change and the global population. Global surface temperature, CO2 levels and natural disasters, which are associated with climate change, have been on a positive trend and if this trend continues, this sets a precarious precedent.

For example, CO2 is a greenhouse gas that contributes to climate change through the greenhouse effect in which heat radiated by the sun is able to reach the Earth, but the remaining and current heat on Earth prevented from escaping to space, warming up the planet (Ritchie & Roser, 2017). This aligns with our research where we found both CO2 levels and average global surface temperature to be rising significantly since the 1970s.

In addition, it must be noted that a large contributor to CO2 levels and consequently climate change, is due to human emissions (Ritchie & Roser, 2017). This includes the utilization of fossil fuels, heavy industrial processes, and forestry among other processes. As our dependence of fossil fuels continue, the Earth will be emitting more CO2 levels which would subsequently increase the global surface temperature.

Similarly, the frequency of natural disasters have also significantly risen in recent years, which may be contributed by the rise in CO2 and surface temperature (Benevolenza & DeRigne, 2018). Although these variables are global phenomenon, climate change will have a disproportional impact on the Global South (Vidal, 2013). In our research we found that although drought was the most common type of natural disaster globally, each country experienced different types or frequencies of natural disasters. For example, in our research we found that floods and landslides were among the top three most common natural disaster in Indonesia. This aligns with existing literature that island nations such as Indonesia may receive more floods, storms, and landslides as climate change continues which may be ill-prepared for these events compared to the United States due to available infrastructure and funding (Vidal, 2013; Podesta, 2021; Benevolenza & DeRigne, 2018). This brings climate change into a larger discussion to climate justice and equity.

Due to the trends and patterns we have uncovered, it is imperative that we as inhabitants of this planet--particularly those from the imperial core and Global North who has historically contributed the most to CO2 and greenhouse gas emission--must take action on these issues in order to prevent climate change from worsening.

## Conclusion

Climate change is a phenomenon that is already happening and increasingly get worse. Indicators and variables associated with climate change such as CO2 levels, global surface temperature, and natural disasters have been on a significant rise and if our current trend continues, we are projected to reach dangerous thresholds that may impact us all. However, we must also acknowledge that the Global South and marginalized communities will be disproportionately and inequitable impacted by climate change. Therefore, we hope our research demonstrates the urgent need to take preventative and tangible measures address and challenge climate change.
