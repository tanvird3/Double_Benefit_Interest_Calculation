library(FinCal)

# fv=pv*(1+i)^n
# 2=1*(1+i/m)^nm
# ln(2)=nm*ln(1+i/m)
# ln(2)/nm=ln(1+i/m)
# exp(ln(2)/nm)=1+i/m
# i=m*(exp(ln(2)/nm)-1)

dbds_rate <- 
  function(duration, compounding_freq, initial_deposit) { 
    
    duration <- duration / 12
    
    # the required interest rate
    int_rate <-
      compounding_freq * (exp(log(2) / (duration * compounding_freq)) - 1)
    
    # int per payment
    int_per_payment <-
      (1 + int_rate / compounding_freq) ^ (compounding_freq / 12) -
      1
    
    # future value check
    future_value <-
      fv(int_per_payment,
         duration * 12,
         pv = -initial_deposit,
         type = 1)
    
    return(list(Interest_Rate = int_rate, Future_Value = future_value))
  }

dbds_rate(120, 1, 100000)
