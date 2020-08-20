
<!DOCTYPE html>
<html lang="en" >
<meta charset="utf-8">
<head>

 <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-165922720-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-165922720-1');
  </script>
    <title>Covid-19 Pandemic Tracker </title>
   <link rel="stylesheet" href="assets/css/tachyons.min.css"> 
  <link rel="stylesheet" href="assets/css/site.css">
     <link rel="stylesheet" href="styles/bootstrap-responsive.min.css"> 
  <script src="ajax/libs/jquery/3-4-1/jquery.min.js"></script>
<script src="assets/js/d3.min.js"></script>
<script src="assets/js/topojson.min.js"></script>
 <script src="assets/js/datamaps.world.min.js"></script>


  <script>
  
  
   var settings = {
    		"async": true,
    		"crossDomain": true,
    		"url": "https://corona-updates.p.rapidapi.com/",
    		"method": "GET",
    		"headers": {
    			"x-rapidapi-host": "corona-updates.p.rapidapi.com",
    			"x-rapidapi-key": "5533bd7babmshc67016969c81137p1627cdjsn9f65e83602bb"
    		}
    	}

       
  //Maps
    
    $.ajax(settings).done(function (response) {
    	 var table3 = $($.parseHTML(response)).find('#main_table_countries_today').DataTable();
     
    var fillcol="";
     var count=  table3.columns(2).data(0);
     var country=  table3.columns(1).data(0);
     var death = table3.columns(4).data(0);
     var totdeath = death[0];
     var ss=country[0] ;
     var aa=count[0];
     var counter=count[0];
     var countries = Datamap.prototype.worldTopo.objects.world.geometries;
     var cd= new  Array("Kingdom","Emirates");
     function getColor(aa,code) {
 		
   	  for(var K = 0; K < aa.length; K++) {
   		  for (var c = 0, d = countries.length; c< d; c++) {
   			if(code== countries[c].id)
   			{
   		
   				  if($(ss[K]).text().trim() == countries[c].properties.name.trim() || 
   				  $(ss[K]).text().trim() == countries[c].id ||
   				  countries[c].properties.name.trim().includes(cd[K]))
   			 		
             {
   	  		
             var num=aa[K].replace(/,/g, '');
   			 if( num > 2000000 )
   				 {
   				
   				return "SUPERHIGH" ;
   				
   				 }
   			 else if( num > 1000000 && num <= 2000000){
   				 return "VERYHIGH" ;
   				 }
   			 else if( num > 500000 && num <= 1000000){
   				 return "HIGH" ;
   				 }
   			 else if( num > 100000 && num <= 500000){
   				 return "SUPERMEDIUM" ;
   				 }
   			 else if( num > 50000 && num <= 100000){
   				 return "MEDIUM" ;
   				 }
   			 else if( num > 25000 && num <= 50000){
   				 return "VERYLOW" ;
   				 }
   			 else if( num > 10000 && num <= 25000){
   				 return "LOW" ;
   				 }
   			 else if( num > 1 && num <= 10000){
   				 return "SUPERLOW" ;
   				 }
   			 else{
   				 return "UNKNOWN" ; 
   			 }
   				 
   			 
   			 
             }
             }
   			  
             }
   	  }
   	    
     }

 
     
     var lifeExpectancyData = [{"ZWE":null,"ZMB":null,"ZAF":null,"YEM":null,"PSE":null,"VUT":null,"VNM":null,"VEN":null,"UZB":null,
    	 "USA":null,"URY":null,"UKR":null,"UGA":null,"TZA":null,"TWN":null,"TUR":null,"TUN":null,
    	 "TTO":null,"TLS":null,"TKM":null,"TJK":null,"THA":null,"TGO":null,"TCD":null,"SYR":null,
    	 "SWZ":null,"SWE":null,"SVN":null,"SVK":null,"SUR":null,"SRB":null,"SOM":null,"-99":null,
    	 "SLV":null,"SLE":null,"SLB":null,"SEN":null,"SSD":null,"SDN":null,"SAU":null,"ESH":null,
    	 "RWA":null,"RUS":null,"ROU":null,"QAT":null,"PRY":null,"PRT":null,"PRK":null,"PRI":null,
    	 "POL":null,"PNG":null,"PHL":null,"PER":null,"PAN":null,"PAK":null,"OMN":null,"NZL":null,
    	 "NPL":null,"NOR":null,"NLD":null,"NIC":null,"NGA":null,"NER":null,"NCL":null,"NAM":null,
    	 "MYS":null,"MWI":null,"MRT":null,"MOZ":null,"MNG":null,"MNE":null,"MMR":null,"MLI":null,
    	 "MKD":null,"MEX":null,"MDG":null,"MDA":null,"MAR":null,"LVA":null,"LUX":null,"LTU":null,
    	 "LSO":null,"LKA":null,"LBY":null,"LBR":null,"LBN":null,"LAO":null,"KWT":null,"-99":null,
    	 "KOR":null,"KHM":null,"KGZ":null,"KEN":null,"KAZ":null,"JPN":null,"JOR":null,"JAM":null,
		 "ITA":null,"ISR":null,"ISL":null,"IRQ":null,"IRN":null,"IRL":null,"IND":null,"IDN":null,
    	 "HUN":null,"HTI":null,"HRV":null,"HND":null,"GUY":null,"GTM":null,"GRL":null,"GRC":null,
    	 "GNQ":null,"GNB":null,"GMB":null,"GIN":null,"GHA":null,"GEO":null,"GBR":null,"GAB":null,
    	 "GUF":null,"FRA":null,"FLK":null,"FJI":null,"FIN":null,"ETH":null,"EST":null,"ESP":null,
    	 "ERI":null,"EGY":null,"ECU":null,"DZA":null,"DOM":null,"DNK":null,"DJI":null,"DEU":null,
    	 "CZE":null,"CYP":null,"-99":null,"CUB":null,"CRI":null,"COL":null,"COG":null,"COD":null,
    	 "CMR":null,"CIV":null,"CHN":null,"CHL":null,"CHE":null,"CAN":null,"CAF":null,"BWA":null,
    	 "BTN":null,"BRN":null,"BRA":null,"BOL":null,"BLZ":null,"BLR":null,"BIH":null,"BHS":null,
    	 "BGR":null,"BGD":null,"BFA":null,"BEN":null,"BEL":null,"BDI":null,"AZE":null,"AUT":null,
    	 "AUS":null,"ATF":null,"ATA":null,"ARM":null,"ARG":null,"ARE":null,"ALB":null,"AGO":null,"AFG":null,"Korea":null}]

                               function isNumber(object) {
                               	return !isNaN(object);
                               }

                               var cntrycode = Object.keys(lifeExpectancyData[0])
                               	//.filter(isNumber)
                               	
                              

                               var data1 = {}

                               cntrycode.forEach(function(year) {
                  		          var fillKey = getColor(aa,year);	// calculate fillkey
									
                               		data1[year] = {
                               			fillKey: fillKey
                               		}
                              
                               })
               
      
                          
                               
                               makeMap(data1);
     function makeMap(data1){
      var map = new Datamap({
   	   element: document.getElementById('container'),
   		responsive: true,
   		       scope: 'world',
       		   fills: {
       			SUPERHIGH:'#000080',
   		        VERYHIGH:'#111E6C',
   	            HIGH: '#1034A6',
   	            SUPERMEDIUM:'#0F52BA',
   	            MEDIUM: '#4682B4',
   	            LOW: '#73C2FB',
   	            VERYLOW:'#56A8EC',	
   	            SUPERLOW:'#95C8D8',
   	            UNKNOWN: '#89CFF0',
   	            defaultFill: "#95C8D8"
       	        },
       		   data:data1,       			   
       		   
       		   geographyConfig: {
       			     highlightFillColor: function(data) {
        			      return '#FFA69E';
        			    }, 
         		    popupTemplate:  function(geography, data){
       		   	 
       		    for(var j=0;j<ss.length;j++)
       		   	 {
       		   	 if($(ss[j]).text()==geography.properties.name || $(ss[j]).text()== geography.id 
       		   			|| ( $(ss[j]).text().trim().includes("UK") && geography.properties.name.trim().includes("Kingdom"))
       		   			||( $(ss[j]).text().trim().includes("UAE") && geography.properties.name.trim().includes("Emirates"))
       		   			||( $(ss[j]).text().trim().includes("Tanzania") && geography.properties.name.trim().includes("Tanzania"))
       		   			||( $(ss[j]).text().trim().includes("Congo") && geography.properties.name.trim().includes("Congo"))
       		   			||( $(ss[j]).text().trim().includes("Serbia") && geography.properties.name.trim().includes("Serbia"))
       		   			||( $(ss[j]).text().trim().includes("Czechia") && geography.properties.name.trim().includes("Czech"))
       		   			||( $(ss[j]).text().trim().includes("Bissau") && geography.properties.name.trim().includes("Bissau"))
       		   			||( $(ss[j]).text().trim().includes("CAR") && geography.properties.name.trim().includes("African"))
                		  ||( $(ss[j]).text().trim().includes("S. Korea") && geography.properties.name.trim().includes("South Korea"))  

       		   	 ) 
       		   		 {
       		   		 if(totdeath[j]=='' || totdeath[j]==null)
       		   			 totdeath[j]=0;
       		       return '<p><b><div class="hoverinfo">' + geography.properties.name + '</b></br><i>'+
       		         'Total Cases:' +counter[j]+'</br> '+'Total Death'+':'+totdeath[j]+'</div></i></p>';
       		   		 }
       		   	 }
       		     }  
       		   }
     });
      var colors = d3.scale.category10();

      $(window).on('resize', function() {
   	   map.resize();
       });
      
        
      var margin = {top: 0, left: 0, bottom: 0, right: 0}
      , width = parseInt(d3.select('#container').style('width'))
      , width = width - margin.left - margin.right
      , mapRatio = .5
      , height = width * mapRatio;
     }
      
    
     });  
     
     </script>
    
 
  <link rel="stylesheet" href="assets/css/spinkit.css">
   <link rel="stylesheet" href="assets/css/spinkit.min.css">
 <!--Favicon  -->
  <link rel="apple-touch-icon" sizes="57x57" href="assets/favicon/apple-icon-57x57.png">
  <link rel="apple-touch-icon" sizes="60x60" href="assets/favicon/apple-icon-60x60.png">
  <link rel="apple-touch-icon" sizes="72x72" href="assets/favicon/apple-icon-72x72.png">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/favicon/apple-icon-76x76.png">
  <link rel="apple-touch-icon" sizes="114x114" href="assets/favicon/apple-icon-114x114.png">
  <link rel="apple-touch-icon" sizes="120x120" href="assets/favicon/apple-icon-120x120.png">
  <link rel="apple-touch-icon" sizes="144x144" href="assets/favicon/apple-icon-144x144.png">
  <link rel="apple-touch-icon" sizes="152x152" href="assets/favicon/apple-icon-152x152.png">
  <link rel="apple-touch-icon" sizes="180x180" href="assets/favicon/apple-icon-180x180.png">
  <link rel="icon" type="image/png" sizes="192x192"  href="assets/favicon/android-icon-192x192.png">
  <link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="96x96" href="assets/favicon/favicon-96x96.png">
  <link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
  <link rel="manifest" href="assets/favicon/manifest.js">
  <meta name="msapplication-TileColor" content="#ffffff">
  <meta name="msapplication-TileImage" content="assets/favicon//ms-icon-144x144.png">
  <meta name="theme-color" content="#ffffff">
   <!--Favicon  -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Open Graph / Facebook -->
  <meta name="og:type" content="website">
  <meta name="og:url" content="https://Covidworldinfo.com">
  <meta name="og:title" content="COVID-19 Pandemic Tracker">
  <meta name="og:description" content="Track the spread of Covid-19 outbreak. Explore the global data with Covid-19 world map. Find key data and analysis on Covid-19 spread across the world.">
  <meta property="og:image" content="assets/img/wbimg1.png" />
 
  <!-- Twitter -->
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:url" content="https://Covidworldinfo.com">
  <meta name="twitter:title" content="COVID-19 Pandemic Tracker">
  <meta name="twitter:description" content="Track the spread of Covid-19 outbreak. Explore the global data with Covid-19 world map. Find key data and analysis on Covid-19 spread across the world.">
  <meta property="twitter:image" content="assets/img/wbimg1.png">
 
  
 
<!-- <script type="text/javascript" src="assets/js/chart.bundle.min.js"></script> -->
<!-- Datatables -->
<script src="v/bs4/dt-1-10-20/datatables.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="v/bs4/dt-1-10-20/datatables.min.css" />

</head>

	
<body >



<div class="center mw7" style="height:50px;">
  
				
        <div class="sk-chase" style="position:responsive; left:45%; width: 60px;height: 60px;">

    <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
  
    </div>

		<svg  data-width="550" class="datamap" style="overflow: hidden;
		 position: responsive; width:0px; height:0px;"> 
		 			  
		 <div id="container" onclick="location.href='http://covidworldinfo.com';" style="cursor:pointer;"   >  
<h6 class="black-40" >
				
				<em >&copy; Copyright @<a href='http://covidworldinfo.com' style="text-decoration:none;">Covidworldinfo.com</a>. All rights reserved.</em>
				</h6>   
 
            </div> 
            <h6 class="black-40" style="text-align:left;">
				<em ><a href='http://covidworldinfo.com' style="text-decoration:none;">&copy;Covidworldinfo.com</a> </em>
				</h6>  
			 	
		 
		
		</svg>	
	
			
</div>
  </div>
   <script> 
        document.onreadystatechange = function() { 
            if (document.readyState !== "complete") {
            	 $(".sk-chase").show();
            	   setTimeout(function () {
            	   $('.sk-chase').hide();
            	}, 4000);
                } else { 
                	 $(".sk-chase").show();
              	   setTimeout(function () {
              	   $('.sk-chase').hide();
              	}, 4000);
            } 
        }; 
    </script> 
   

  </body>
    	
</html>
