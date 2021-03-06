//+------------------------------------------------------------------+
//|                                                HistoryExport.mq5 |
//|                                                           Рэндом |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Рэндом"
#property link      ""
#property version   "1.00"
#property script_show_inputs
//--- input parameters
input string   Fname="EURUSD1M.csv";
input int      NBars=50000;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
      int limit=Bars(Symbol(),Period());
      if(limit>NBars) limit=NBars;
      MqlRates his[];
      ArrayResize(his,limit);
      CopyRates(Symbol(),Period(),0,limit,his);
      int ot=FileOpen(Fname,FILE_WRITE|FILE_ANSI,";");
      string hdr="Date,Time,Open,High,Low,Close,Volume";
      FileWrite(ot,hdr);
      for(int i=0;i<limit;i++)
      {
         string d=TimeToString(his[i].time,TIME_DATE)+","+TimeToString(his[i].time,TIME_MINUTES)+","+DoubleToString(his[i].open,Digits())+","+DoubleToString(his[i].high,Digits())+","
                  +DoubleToString(his[i].low,Digits())+","+DoubleToString(his[i].close,Digits())+","+IntegerToString(his[i].tick_volume);
         FileWrite(ot,d);
      }
      FileClose(ot);
  }
//+------------------------------------------------------------------+
