Fitting the normal and inverse gaussian distributions(wald)                                                                          
                                                                                                                                     
I was unable to generate inverse gaussian random variates with base SAS so I used the R function 'rinvgause'.                        
                                                                                                                                     
Note: IML can generate random inverse gaussian variates (Wald distribution)                                                          
   call randgen(x, 'WALD', 1, 2)                                                                                                     
                                                                                                                                     
SOAPBOX ON                                                                                                                           
                                                                                                                                     
  SAS needs to add inverse gaussian(Wald distribution) to base SAS                                                                   
  Less is more (ie SAS and R without IML?)                                                                                           
                                                                                                                                     
SOAPBOX OFF                                                                                                                          
                                                                                                                                     
Both distributions were generated with mean=1 and shape parameters 2.                                                                
                                                                                                                                     
Most of the R code was to get data into and out of R.                                                                                
                                                                                                                                     
github                                                                                                                               
https://tinyurl.com/y6deseyp                                                                                                         
https://github.com/rogerjdeangelis/utl-fitting-the-normal-and-inverse-gaussian-distributions                                         
                                                                                                                                     
StackOverflow SAS                                                                                                                    
https://tinyurl.com/y4wvq9p6                                                                                                         
https://stackoverflow.com/questions/57696389/how-can-i-calculate-the-normal-and-inverse-normal-distribution-function-in-sas          
                                                                                                                                     
*_                   _                                                                                                               
(_)_ __  _ __  _   _| |_                                                                                                             
| | '_ \| '_ \| | | | __|                                                                                                            
| | | | | |_) | |_| | |_                                                                                                             
|_|_| |_| .__/ \__,_|\__|                                                                                                            
        |_|                                                                                                                          
;                                                                                                                                    
                                                                                                                                     
* generate 60 random variates from normal and inverse normal;                                                                        
options validvarname=upcase;                                                                                                         
libname sd1 "d:/sd1";                                                                                                                
data sd1.have;                                                                                                                       
 call streaminit(4321);                                                                                                              
 input invnorm @@;                                                                                                                   
 norm = RAND('NORMAL',1,2);                                                                                                          
cards4;                                                                                                                              
0.763 0.265 0.667 0.759 3.505 0.742 0.496 1.087 0.499 0.344 0.755                                                                    
3.183 1.341 1.002 0.797 1.815 3.060 1.151 0.684 1.236 1.576 0.636                                                                    
0.618 0.971 0.492 0.508 2.642 0.804 0.879 0.359 0.542 0.646 1.711                                                                    
1.135 0.957 0.235 1.604 0.581 0.720 0.516 0.452 0.739 0.586 1.217                                                                    
1.250 0.896 0.669 1.227 0.845 0.284 2.402 0.758 1.839 0.353 0.482                                                                    
0.488 1.142 1.145 0.558 0.257                                                                                                        
;;;;                                                                                                                                 
run;quit;                                                                                                                            
                                                                                                                                     
options ls=64 ps=32;;                                                                                                                
proc chart data=sd1.have;                                                                                                            
vbar norm;                                                                                                                           
run;quit;                                                                                                                            
                                                                                                                                     
proc means data=sd1.have;                                                                                                            
var norm;                                                                                                                            
run;quit;                                                                                                                            
*                                 _                                                                                                  
 _ __   ___  _ __ _ __ ___   __ _| |                                                                                                 
| '_ \ / _ \| '__| '_ ` _ \ / _` | |                                                                                                 
| | | | (_) | |  | | | | | | (_| | |                                                                                                 
|_| |_|\___/|_|  |_| |_| |_|\__,_|_|                                                                                                 
                                                                                                                                     
;                                                                                                                                    
                                                                                                                                     
Frequency                                                                                                                            
                                                                                                                                     
   |                           XXXXX                                                                                                 
20 +    mean  = 0.9205772      XXXXX                                                                                                 
   |    stdev = 2.1705512      XXXXX                                                                                                 
   |                           XXXXX                                                                                                 
   |                           XXXXX                                                                                                 
   |                           XXXXX                                                                                                 
15 +                           XXXXX   XXXXX                                                                                         
   |                   XXXXX   XXXXX   XXXXX                                                                                         
   |                   XXXXX   XXXXX   XXXXX                                                                                         
   |                   XXXXX   XXXXX   XXXXX                                                                                         
   |                   XXXXX   XXXXX   XXXXX                                                                                         
10 +                   XXXXX   XXXXX   XXXXX                                                                                         
   |                   XXXXX   XXXXX   XXXXX                                                                                         
   |                   XXXXX   XXXXX   XXXXX                                                                                         
   |                   XXXXX   XXXXX   XXXXX                                                                                         
   |                   XXXXX   XXXXX   XXXXX                                                                                         
 5 +           XXXXX   XXXXX   XXXXX   XXXXX                                                                                         
   |           XXXXX   XXXXX   XXXXX   XXXXX                                                                                         
   |           XXXXX   XXXXX   XXXXX   XXXXX   XXXXX                                                                                 
   |           XXXXX   XXXXX   XXXXX   XXXXX   XXXXX                                                                                 
   |   XXXXX   XXXXX   XXXXX   XXXXX   XXXXX   XXXXX   XXXXX                                                                         
   ------------------------------------------------------------                                                                      
         -5      -3      -1      1       3       5       7                                                                           
                                                                                                                                     
                           NORM Midpoint                                                                                             
*              _     _                                                                                                               
__      ____ _| | __| |                                                                                                              
\ \ /\ / / _` | |/ _` |                                                                                                              
 \ V  V / (_| | | (_| |                                                                                                              
  \_/\_/ \__,_|_|\__,_|                                                                                                              
                                                                                                                                     
;                                                                                                                                    
options ls=64 ps=32;;                                                                                                                
proc chart data=sd1.have;                                                                                                            
vbar invnorm;                                                                                                                        
run;quit;                                                                                                                            
                                                                                                                                     
proc means data=sd1.have;                                                                                                            
var invnorm;                                                                                                                         
run;quit;                                                                                                                            
                                                                                                                                     
                                                                                                                                     
Frequency                                                                                                                            
                                                                                                                                     
   |             *****                                                                                                               
25 + mean = 1.00 *****                                                                                                               
   |lamda = 2    *****                                                                                                               
   |             *****                                                                                                               
   |             *****                                                                                                               
   |             *****                                                                                                               
20 +             *****                                                                                                               
   |    *****    *****                                                                                                               
   |    *****    *****                                                                                                               
   |    *****    *****                                                                                                               
   |    *****    *****                                                                                                               
15 +    *****    *****                                                                                                               
   |    *****    *****                                                                                                               
   |    *****    *****                                                                                                               
   |    *****    *****                                                                                                               
   |    *****    *****                                                                                                               
10 +    *****    *****                                                                                                               
   |    *****    *****                                                                                                               
   |    *****    *****    *****                                                                                                      
   |    *****    *****    *****                                                                                                      
   |    *****    *****    *****                                                                                                      
 5 +    *****    *****    *****                                                                                                      
   |    *****    *****    *****                                                                                                      
   |    *****    *****    *****                      *****                                                                           
   |    *****    *****    *****    *****    *****    *****                                                                           
   |    *****    *****    *****    *****    *****    *****                                                                           
   -----------------------------------------------------------                                                                       
         0.3      0.9      1.5      2.1      2.7      3.3                                                                            
                                                                                                                                     
                         INVNORM Midpoint                                                                                            
                                                                                                                                     
                                                                                                                                     
*            _               _                                                                                                       
  ___  _   _| |_ _ __  _   _| |_                                                                                                     
 / _ \| | | | __| '_ \| | | | __|                                                                                                    
| (_) | |_| | |_| |_) | |_| | |_                                                                                                     
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                    
                |_|                                                                                                                  
;                                                                                                                                    
                                                                                                                                     
Note both distributions were generated with mean=1 and shape/sd=2                                                                    
                                                                                                                                     
   DISTRIBUTION        DES      RIG_ESTI                                                                                             
                                                                                                                                     
   inverse gaussian    mean      0.99792  * limit as n->OO = 1                                                                       
   inverse gaussian    shape     2.15627  * limit as n->OO = 2                                                                       
                                                                                                                                     
   normal              mean      0.92058  * limit as n->OO = 1                                                                       
   normal              sd        2.15239  * limit as n->OO = 2                                                                       
                                                                                                                                     
*                                                                                                                                    
 _ __  _ __ ___   ___ ___  ___ ___                                                                                                   
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                                  
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                                  
| .__/|_|  \___/ \___\___||___/___/                                                                                                  
|_|                                                                                                                                  
;                                                                                                                                    
                                                                                                                                     
%utl_submit_r64('                                                                                                                    
library(haven);                                                                                                                      
library(SASxport);                                                                                                                   
library(statmod);                                                                                                                    
library(fitdistrplus);                                                                                                               
have<-read_sas("d:/sd1/have.sas7bdat");                                                                                              
y <- have$INVNORM;                                                                                                                   
fig <- fitdist(y, "invgauss", start = list(mean = .5, shape = .5));                                                                  
rig=summary(fig);                                                                                                                    
inv<-as.data.frame(rig$estimate,);                                                                                                   
inv$des<-rownames(inv);                                                                                                              
z <- have$NORM;                                                                                                                      
fg <- fitdist(z, "norm");                                                                                                            
rfg<-summary(fg);                                                                                                                    
nrm<-as.data.frame(rfg$estimate);                                                                                                    
nrm$des<-rownames(nrm);                                                                                                              
colnames(nrm)=colnames(inv);                                                                                                         
write.xport(inv,nrm,file="d:/xpt/want.xpt")                                                                                          
');                                                                                                                                  
                                                                                                                                     
options ls=70;                                                                                                                       
libname xpt xport "d:/xpt/want.xpt";                                                                                                 
proc copy in=xpt out=work;                                                                                                           
run;quit;                                                                                                                            
                                                                                                                                     
data want;                                                                                                                           
  retain distribution des;                                                                                                           
  set  inv(in=a) nrm;                                                                                                                
  if a then distribution="inverse gaussian";                                                                                         
  else distribution="normal";                                                                                                        
run;quit;                                                                                                                            
                                                                                                                                     
libname xpt clear;                                                                                                                   
                                                                                                                                     
proc print data=want;                                                                                                                
run;quit;                                                                                                                            
                                                                                                                                     
                                                                                                                                     
Obs    DISTRIBUTION        DES      RIG_ESTI                                                                                         
                                                                                                                                     
 1     inverse gaussian    mean      0.99792                                                                                         
 2     inverse gaussian    shape     2.15627                                                                                         
 3     normal              mean      0.92058                                                                                         
 4     normal              sd        2.15239                                                                                         
                                                                                                                                     
                                                                                                                                     
                                                                                                                                     
                                                                                                                                     
