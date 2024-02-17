# ultimate-model-backtester
Edition V2

#### Purpose:
This project delivers a robust backtesting program for any finance model, algorithmic trading models, etc., as long as the model can produce a JSON file following a very flexible template.

The idea is to have a universe source to backtest all models and allows for quick and easy comparison

#### Central Methodology:
- The backtester program will take a JSON file as input. This file will contain all the data needed to create a portfolio and perform transactions at specific dates (referred to as the 'decision' dataframe in the code). 

- Next, the program acquires stock specific data from a Microsoft Azure SQL Database with all the cached historical stock prices and load new data from Yahoo Finance API if the data is not in the database. The reason for caching data in the database is to reduce the number of API calls, hence improve the programs' scalability.

- Then, the program run through pre-defined functions to calculate the portfolio metrics and values, with reference to the transaction decisions provided.

- Lastly, the program produces some common analysis comparing the target algorithmic model against the underlying assets and other common models.

#### Procedure (refer to backtester.ipynb for details):
1. Define useful default parameters, such as the hypothetic capital we have to invest in the model
2. Define the JSON parsing class. This allows for flexibiliy as we can create a new class to parse JSON files of a new format
3. Define the Model class. This will be there all the portfolio returns and metrics be calculated.
4. Construct the model with the defined information
5. Perform some analysis on the models against other models and the underlying assets

**Note: the sample JSON file of a model comes from the Fama-French Trading Model, which is another project of mine**
