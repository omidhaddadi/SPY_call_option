//+------------------------------------------------------------------+
//|                                              SPY_call_option_M30 |
//|                                     Copyright 2023, Omid Haddadi |
//|                                                                  |
//+------------------------------------------------------------------+

int start()
  {
   double lot_buy_01=0.01,lot_sell_01=0.01,lot_buy_02=0.01,lot_sell_02=0.01;
   double stoploss=0.07;
   double takeprofit=0.02;
   double stoploss2=(5000*Point);
   double takeprofit2=(7000*Point);
   int DXPeriod=200, DXPeriod2=300,DXPeriod3=140,j=0;
   int wait_minute=5;
   int starti,i=DXPeriod,counted_bars=IndicatorCounted();
   int q,p,m,n,total_order=OrdersTotal();
   double atr_30M,atr,bestbuy,bestsell,adx,acc_equity=AccountEquity();


      for(int k=total_order-1; k>=0; k--)
         {
                if (OrderSelect(k, SELECT_BY_POS)){
                     if(OrderType()==OP_BUY && OrderSymbol()=="SPX500"){q=1;}
                     if(OrderType()==OP_SELL && OrderSymbol()=="SPX500"){p=1;}
               }
         }




//--------------- Medium volatility ----------------------------------------------------     

      double atr2=iATR(Symbol(),0,DXPeriod,0);
      double atr_30M2=iATR(Symbol(),PERIOD_M30,112,0);
      double atr_30M22=iATR(Symbol(),PERIOD_M30,5,0);
      double adx2=iADX(Symbol(),0,DXPeriod2,PRICE_CLOSE,0,0);
      double bestbuy2=iADX(Symbol(),0,DXPeriod2,PRICE_CLOSE,1,0);
      double bestsell2=iADX(Symbol(),0,DXPeriod2,PRICE_CLOSE,2,0);
      double bb_up_value2=iBands(NULL,0,150,2,0,PRICE_HIGH,MODE_UPPER,0);
      double bb_low_value2=iBands(NULL,0,150,2,0,PRICE_LOW,MODE_LOWER,0);
      double envel_up_value2=iEnvelopes(NULL,0,300,MODE_SMA,0,PRICE_HIGH,1.2,MODE_UPPER,0);
      double envel_low_value2=iEnvelopes(NULL,0,150,MODE_SMA,0,PRICE_LOW,1.2,MODE_LOWER,0);
      double max_bb_envel2= MathMax(bb_up_value2,envel_up_value2);
      double min_bb_envel2= MathMin(bb_low_value2,envel_low_value2);
      double ma=iMA(NULL,PERIOD_D1,38,0,MODE_SMA,PRICE_CLOSE,0);
      
      double envel_up_value22=iEnvelopes(NULL,PERIOD_M30,150*(atr_30M22/Ask)*13,MODE_SMA,0,PRICE_HIGH,150*(atr_30M22/Ask)*1.8,MODE_UPPER,10);
      double envel_low_value22=iEnvelopes(NULL,PERIOD_M30,150*(atr_30M22/Bid)*13,MODE_SMA,0,PRICE_LOW,150*(atr_30M22/Bid)*1.8,MODE_LOWER,30);
      double rsi2 = iRSI(NULL,PERIOD_M30,1000,PRICE_CLOSE,0);


      if((p==0)&&(bestbuy2>2)&&(adx2<11)&&(bestsell2>1)&&(Ask>max_bb_envel2)&&(atr_30M2<(Ask*5/800))&&(Ask*1.01>envel_up_value22)&&(rsi2<52)&&(Ask>ma)){m=0;

//         OrderSend(Symbol(),OP_BUY,lot_buy_01,Ask,10,Bid-stoploss2,Bid+takeprofit2);
//         OrderSend(Symbol(),OP_SELL,0.01,Bid,10,Bid+(Bid*stoploss/3.5),Bid-(Bid*takeprofit*3.5),"SPY_call_option_M30_v5");

}

      if((q==0)&&(bestsell2>2)&&(adx2<11)&&(bestbuy2>1)&&(Bid<min_bb_envel2)&&(atr_30M2<(Bid*5/800))&&(Bid*0.99<envel_low_value22)&&(rsi2>48)&&(Ask>ma)){n=0;

//         OrderSend(Symbol(),OP_SELL,lot_sell_02,Bid,10,Ask+stoploss2,Ask-takeprofit2);
         OrderSend(Symbol(),OP_BUY,0.01,Ask,10,Ask-(Ask*stoploss*1),Ask+(Ask*takeprofit*1),"SPY_call_option_M30_v5");

}



      
      

   return(0);

  }
//+------------------------------------------------------------------+
