# SPY_call_option
**SPX500 Call Option Strategy Version 1**

This repository contains an MQL4 script for MetaTrader 4 (MT4), designed to simulate automated trading strategies for SPX500. It uses a combination of technical analysis indicators and predefined trading conditions.

> **Note:** This script is intended for testing on a **demo account only**. Do not use this code for live trading. Actual call option trades should be executed manually through your **stock market broker** based on insights gained from this strategy.

---

## **Features**
- **Automates trade simulation** for SPX500 in a demo environment.
- **Parameters include**:
  - Configurable lot sizes for buy/sell orders.
  - Stop-loss and take-profit levels to manage risk.
  - Integration of indicators like ATR, ADX, RSI, Bollinger Bands, Envelopes, and Moving Averages.
- **Risk management features** to prevent conflicting orders.

---

## **Code Overview**
The script (`SPY_call_option_M30`) performs the following tasks:

### **1. Initializes Trading Parameters**
- Defines trade-specific variables:
  - `lot_buy_01`, `lot_sell_01`, `lot_buy_02`, `lot_sell_02` for trade sizes.
  - `stoploss` and `takeprofit` to manage risk and rewards.

### **2. Uses MetaTrader’s Functions**
- **`OrderSelect()`**: Iterates through existing trades to avoid duplicate orders.
- **`OrderType()`**: Identifies the type of active trade (buy/sell).

### **3. Combines Indicators for Decision Making**
- **ATR (iATR):** Measures volatility across different timeframes.
- **ADX (iADX):** Determines trend strength and directional movement.
- **RSI (iRSI):** Identifies overbought or oversold conditions.
- **Bollinger Bands and Envelopes:** Pinpoint entry/exit opportunities using dynamic price ranges.
- **Moving Average (iMA):** Confirms trends to validate trade direction.

### **4. Simulates Trade Execution**
- Analyzes indicator values and executes simulated buy/sell orders in a **demo environment** only.
- Ensures conditions such as trend alignment and volatility thresholds are met.

---

## **Usage Instructions**

### **1. Install the Script**
- Copy `SPY_call_option_M30` to the `MQL4/Experts` folder in your MT4 directory.

### **2. Compile the Script**
- Open MetaEditor, load the script, and compile it to ensure there are no errors.

### **3. Run the Script on MT4**
- Attach the script to the SPX500 chart in MT4 using the **M30 timeframe**.
- Ensure this is run on a **demo account** only.

### **4. Live Trading Advice**
- Do **NOT** run this script for live trading.
- Use the signals generated in the demo account to **manually execute trades** through your stock market broker for call options.

## **5. Backtest Results**
The following backtest results demonstrate the performance of the SPY_call_option_M30_v5 strategy under simulated conditions.

![Backtest Summary](results/Strategy_Tester.pdf)

---

## **Note**
This is an **early version** and is designed strictly for **demo trading** and backtesting purposes. For live trading, consult with a financial expert and manually execute trades to maintain full control over risk management.

---

## **Risk Disclaimer**
Trading financial instruments, including SPX500 and call options, involves significant risk. This script is intended for educational and testing purposes only. Use it responsibly and consult with a professional broker for live trading activities.
