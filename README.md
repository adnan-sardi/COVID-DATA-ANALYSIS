# **COVID DATA ANALYSIS**

**Introduction**: Coronavirus disease 2019 or SARS-CoV-2 is defined as illness caused serious and critical respiratory problem, which it was identified in Wuhan, Hubei, China in January 2020. Actually Covid infected almost 639M and has killed over 6M of people. 

In this analysis we will use a dataset where the last day of it is November 6th 2022. Our data is taken on website: https://ourworldindata.org/covid-deaths and before started own analysis we made a data cleaning, tipically phase for data scientist/analysit. 

**Data cleaning**: After downloading the dataset we splited it into two. The first one is care about information of deaths and the second one is about information on  vaccinated people. However being very large and confusional we thought was more convinient using some SQL server for manipulate dataset based on what we want, we used SQL Microsoft and it was possible to connect it to own server in Tableau for data visualization. 
The script of SQL can be found in 'SQL data exploration.sql' in this reporty. 

**Analysis**: 

In own dataset we could do every analysis we want for any country, because I live in Italy I choose it as state for some initial consideration, than I considered all country yet.

**Now we report the italian summary about Covid until 6th November 2022.**

**ITALY NUMBERS**

![Italy Summary Table](https://user-images.githubusercontent.com/104760218/204905976-65fb2958-9dd5-42e7-ad37-39a0ad716efe.png)

As we can see the ratio of *Total Cases* and *Total_Deaths* are less than 5%, which makes us think about a good health organization system or a good epidemic management. This is also confirmed by the *Percentage vaccinated*, at least 81.26% of population is fully vaccinated. 
Obviously the summary could be as large as we want by taking another datas. 


![Italy Data Visual](https://user-images.githubusercontent.com/104760218/204909302-30dcae48-ae9e-4b7b-a3da-ec22282ee2b7.png)

In this chart we have three different lines:
- Red, indicated *Total_Cases*
- Dark, indicated *Total_Deaths*
- Blue, indicated *People_Fully_Vaccinated*

Now we are going to describe each line for different time scale for each of them.

**Total_Cases**:
Here we have two points where the line increases, the firt part it was between Sept. 2020 and Jan 2021 while the second was on Jan 2022. The last one it was been more impacted respect the first but this is beacuse the main part of population had at least one dose of vaccine.
Than the curve has always increased as we could immagined.

**Total_Deaths**:
Also here we have two different points to analyse but in different time scale than before. 
The first, unfortunately, it was at the beginning of epidemic where we unknown the virus while the second part it was during Sept. 2020 and Jan 2021 that is when the cases increased a lot, we might say that here the epidemic was still aggressive as more or less Apr. 2020. 
After Jan 2021 the number of deaths remained constant but still increase.

**People_Fully_Vaccinated**:
Distribution of vaccines in Italy started between Dec. 2020 and Jan. 2021, of course the line follows a parabolic curve until Jan 2022. Here most people have been vaccinated, and the number of unvaccinated people is always lower than before. In the last five months, the line seems asymptotic at 50 milion people.



**GLOBAL NUMBERS**
![Top 10 Country Deaths](https://user-images.githubusercontent.com/104760218/205102426-51aafea9-27d6-4da2-b8ce-99359b2988f1.png)

In this plot we taken the country that have equal or more 150K deaths, the legend help us to understand the country. 
Now we can ask to ourself why this countries have many diedes. My opinion come from the management of the virus and the country hospital system, indeed coutries as Brazil, India, Mexico and Perù have a friable hospital system and in a situation like Covid this system is put in front an hard challenge.
Countries such as the U.S. and U.K. have outdated health care systems that respect the needs of their citizens.
Last sentence was influenced by *Tony Judt* (Tony Robert Judt FBA was a British-American historian, essayist and university professor who specialized in European history) in *"Guasto è il mondo"*, I readed it in italian.
While countries as Italy, Germany and France probably have many deaths because the Covid has trasmitted in Europe earlier than in other continents.


![World Visualization of Deaths](https://user-images.githubusercontent.com/104760218/205110102-eb753c8a-3a73-4bec-aced-02955921e177.png)

This map represents the *Percent population infected* where yellow indicates zero and the red the maximum value, in this case 67,26%. 
Focusing on the red areas we can find the main countires in Europe with the U.S. and Australia. As we mentioned before this is because covid has trasmitted in Europe earlier than in other continents and the size of european nations isn't large.

This analysis hasn't been made for carefully analyze the damage done by covid, there are many sites on web for thaking notices about it.
My purpuse was to improve my skills with SQL and Tableu, I invite everyone to look at my code for understand what I did and what I could did better, finally I want to thank a youtuber *"Alex the analyst"* who helped me in this analyisis.
