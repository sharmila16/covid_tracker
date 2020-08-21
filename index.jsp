<!DOCTYPE html>
<html lang="en" >
<meta charset="utf-8">
<head>

 <!-- Global site tag (gtag.js) - Google Analyticse -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-165922720-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-165922720-1');
  </script>
        <script data-ad-client="ca-pub-8407572649351988" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    
     <title>Covid-19 Pandemic Tracker </title>
    <meta name="title" content="COVID-19 Pandemic Tracker">
    <meta name="description" content="Track the spread of Covid-19 outbreak. Explore the global data with Covid-19 world map. Find key data and analysis on Covid-19 spread across the world.">
     
 
      <style>
 	.mt_a {
	  color: currentColor;
	  cursor: not-allowed;
	  text-decoration: none;
	}
	table.dataTable thead tr {
  background-color: #2E7FBF94;
}
table.dataTable tr.even {
    background-color: #25a2d829;
}
table.dataTable tr.odd {
    background-color: #222b024a !important;
}
  </style>
    
    
    
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
    	$.ajax(settings).done(function (response) {
         
           var success =  $($.parseHTML(response)).find("#maincounter-wrap").text(); 
           var res = success.split(":");
           var totCase =  res[1].replace("Deaths", "");
           var deathCase= res[2].replace("Recovered", "");
           document.getElementById("deathCases").innerHTML=deathCase.trim();
           document.getElementById("totCases").innerHTML=totCase.trim();
           document.getElementById("recovCases").innerHTML=res[3].trim();
           var actCase= $($.parseHTML(response)).find(".panel_front").text(); 
         
           var res1 = actCase.split("\n");
           document.getElementById("activeCases").innerHTML=res1[1].trim();
           document.getElementById("activeCases1").innerHTML=res1[1].trim();
           document.getElementById("activeCases3").innerHTML=res1[1].trim();
           var res22 = actCase.split("(");
         var mildcond =  res22[1].replace("%", "\n");
         var sercri =  res22[2].replace("%", "\n");
         var recov =  res22[3].replace("%", "\n");
         var death =  res22[4].replace("%", "\n");
         var mildcond1 =  mildcond.split(")");
         var sercri1 =  sercri.split(")");
         var recov1 =  recov.split(")");
         var death1 =  death.split(")");
         
         document.getElementById("millisecond").innerHTML=mildcond1[0]+"% in Mild Condition";
         document.getElementById("seriouscritic").innerHTML=sercri1[0]+"% in Serious/Critical";
         document.getElementById("recovery").innerHTML=recov1[0]+"% Recovered";
         document.getElementById("deathss").innerHTML=death1[0]+"% Deaths ";;
         
         var res23 = actCase.split("\n");
        
         document.getElementById("clocase1").innerHTML=res23[14].trim();
         document.getElementById("clocase2").innerHTML=res23[14].trim();
         
         
         
           //datatable
           var table1 = $($.parseHTML(response)).find('#main_table_countries_today').DataTable();
         // table1.order( [0, 'desc' ] ).draw();
        
     var data = table1.rows().data();
           
           var table = $('#country-table').DataTable();
  
    for(var i=0;i<data.length;i++)
	{
table.row.add(data[i]).draw();
	}
    });
    
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
   /*   for (var l = 0, m = countries.length; l< m; l++) {
    	 var lam='"'+countries[l].id+'"'+":"+null +","+"\n" +lam;
     var samp=countries[l].id;
     } */
 
     
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
   		//projection: 'mercator',
          scope: 'world',
       		   fills: {
       			SUPERHIGH:'#111E6C',
   		        VERYHIGH:'#000080',
   	            HIGH: '#1034A6',
   	            SUPERMEDIUM:'#0F52BA',
   	            MEDIUM: '#4682B4',
   	            LOW: '#56A8EC',
   	            VERYLOW:'#73C2FB',	
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
      
      // d3.select(window).on('resize', resize);
      
      var margin = {top: 0, left: 0, bottom: 0, right: 0}
      , width = parseInt(d3.select('#container').style('width'))
      , width = width - margin.left - margin.right
      , mapRatio = .5
      , height = width * mapRatio;
     }
      
     // var projection = d3.geo.albersUsa().scale(width).translate([width/2, height/2]);
  // var path = d3.geo.path().projection(projection);
    
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

<div class="center mw7" style="height:100px;">
  
  <div class="switch-wrapper" style="position:responsive;">
 
     	<nav class="db dt-l w-100 border-box pa3">
     	
     	<img class="theme-icon" src="assets/img/moon.svg" >
					<div class="theme-switch" >
						<div class="switch">
						</div>
						</div>
						</nav>
					</div>
 
   <article class="cf">
   <div class="enjoy-css2">
   <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v7.0"></script>
  
      <ul class="share-buttons" style="position:responsive;" >
  <!-- <li><a href="https://www.facebook.com/sharer/sharer.php?u=&quote=" title="Share on Facebook" target="_blank" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(document.URL) + '&quote=' + encodeURIComponent(document.URL)); return false;"><img alt="Share on Facebook" src="assets/img/Facebook.png" /></a></li>-->
  <li><a href="https://twitter.com/intent/tweet?source=&text=:%20" target="_blank" title="Tweet" onclick="window.open('https://twitter.com/intent/tweet?text=' + encodeURIComponent(document.title) + ':%20'  + encodeURIComponent(document.URL)); return false;"><img alt="Tweet" src="assets/img/Twitter.png" /></a></li>
  <!-- <li><a href="https://plus.google.com/share?url=" target="_blank" title="Share on Google+" onclick="window.open('https://plus.google.com/share?url=' + encodeURIComponent(document.URL)); return false;"><img alt="Share on Google+" src="assets/img/Google+.png" /></a></li>-->
  <!-- <li><a href="http://www.tumblr.com/share?v=3&u=&quote=&s=" target="_blank" title="Post to Tumblr" onclick="window.open('http://www.tumblr.com/share?v=3&u=' + encodeURIComponent(document.URL) + '&quote=' +  encodeURIComponent(document.title)); return false;"><img alt="Post to Tumblr" src="assets/img/Tumblr.png" /></a></li>-->
<li><a href="http://pinterest.com/pin/create/button/?url=&description=" target="_blank" title="Pin it" onclick="window.open('http://pinterest.com/pin/create/button/?url=' + encodeURIComponent(document.URL) + '&description=' +  encodeURIComponent(document.title)); return false;"><img alt="Pin it" src="assets/img/Pinterest.png" /></a></li> 
 <!--<li><a href="http://www.reddit.com/submit?url=&title=" target="_blank" title="Submit to Reddit" onclick="window.open('http://www.reddit.com/submit?url=' + encodeURIComponent(document.URL) + '&title=' +  encodeURIComponent(document.title)); return false;"><img alt="Submit to Reddit" src="assets/img/Reddit.png" /></a></li>-->
  <li><a href="http://www.linkedin.com/shareArticle?mini=true&url=&title=&summary=&source=" target="_blank" title="Share on LinkedIn" onclick="window.open('http://www.linkedin.com/shareArticle?mini=true&url=' + encodeURIComponent(document.URL) + '&title=' +  encodeURIComponent(document.title)); return false;"><img alt="Share on LinkedIn" src="assets/img/LinkedIn.png" /></a></li>
  <li><a href="mailto:?subject=&body=:%20" target="_blank" title="Send email" onclick="window.open('mailto:?subject=' + encodeURIComponent(document.title) + '&body=' +  encodeURIComponent(document.URL)); return false;"><img alt="Send email" src="assets/img/Email.png" /></a></li>
  <!--</li>-->
</ul>
 
  <div class="background1"> 
  <div class="fb-like" data-href="http://covidworldinfo.com" data-width="" data-layout="button" data-action="like" data-size="large" data-share="false" style="left:0px; bottom:10px;">  
 </div>

 </div>
  </div>


 </article>
 
 <div class="enjoy-css2">
        <article class="cf">
        
<header class="header mw5 mw7-ns tl pa3" 
				style="width: 950px; height: 72px;" >

	<h1 class="mt0" style="font-family: Teko, sans-serif;
font-size: 27px;
color: #3696C4BF; "> 				
<span class="icon">
              <img src="assets/img/pandemic.png"  style="width: 38px;">
            </span>COVID OUTBREAK </h1>
            
             	</header>
						    
					</article>		
					  <div class="sk-chase" style="position:responsive; left:45%; width: 60px;height: 60px;">

    <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
      <div class="sk-chase-dot"></div>
  
    </div>
		 	             <header class="header mw5 mw7-ns tl pa3" style="height:60px; width:900px;" >
 	
<h6 class="black-40"  style="width:100px;"><b>Low to High</b></h6> 
<div class="color" style="background:#95C8D8"></div>
<div class="color" style="background:#73C2FB"></div>
<div class="color" style="background:#56A8EC"></div>
<div class="color" style="background:#4682B4"></div>
<div class="color" style="background:#0F52BA"></div>
<div class="color" style="background:#1034A6"></div>
<div class="color" style="background:#000080"></div>
<div class="color" style="background:#111E6C" style=" float:left;"></div><br>
	  
	       </header>
	       	 	 <h6 class="black-40" style="text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;Note: Hover/touch the map for more Info</h6>
	       
	       
	<svg  data-width="550" class="datamap" style="overflow: hidden;
		 position: responsive; width:0px; height:0px;"> 
		  
		 <div id="container" >  

	       </div>
	       </svg>
	       

<header class="header mw5 mw7-ns tl pa3" style="height:130px;" >	
 <h6 class="black-40" >	
<b>Embed code for Covid world map:</b>
</h6>		
		 
<textarea rows="2" cols="100" spellcheck="false" ><iframe src="http://covidworldinfo.com/map_widget.jsp" scrolling="No" height="600px" width="100%" style="border: none;"></iframe></textarea>
<h6 class="black-40" style="text-align:left;">Copy & Paste the above HTML code into your website.</h6>
	  	    	  	 
  </header>
          		 	
				 <article class="cf">		
          <div class="fl w-50 tc stat-card">
          <div class="card-box tilebox-one">
            <span class="icon">
              <img src="assets/img/science.png">
            </span>
            <h6 class="black-40 ttu tl">Total Cases</h6>
            <h3 class="black tl" id='totCases' data-plugin="counterup"></h3>
            <div class="sub-info pt3 pb4">
    
              <span id="deathss" class="badge badge-danger mr-1"></span> 
         <span class="text-muted black-40">in closed cases:&nbsp;</span>
            <b><span class="text-muted black-40" id="clocase2" ></span></b>
     
            </div>
          </div>
        </div>
        <div class="fl w-50 tc stat-card">
          <div class="card-box tilebox-one">
            <span class="icon">
              <img src="assets/img/danger.png">
            </span>
            <h6 class="black-40 ttu tl">Total Deaths</h6>
            <h3 class="black tl" id='deathCases' data-plugin="counterup"></h3>
            <div class="sub-info pt3 pb4">
              <span id="seriouscritic" class="badge badge-danger mr-1"></span>
               <span class="text-muted black-40">out of active cases:&nbsp;</span>
            <b><span class="text-muted black-40" id="activeCases" ></span></b>
     
            </div>
          </div>
        </div>
      </article>
      
      <article class="cf">
        <div class="fl w-50 tc stat-card">
          <div class="card-box tilebox-one">
            <span class="icon"><img src="assets/img/heart-shape.png"></span>
            <h6 class="black-40 ttu tl">Total Recoveries</h6>
            <h3 class="black tl" id='recovCases'data-plugin="counterup"></h3>
            <div class="sub-info pt3 pb4">
              <span id="recovery" class="badge badge-success mr-1"></span>
            <span class="text-muted black-40">in closed cases:&nbsp;</span>
            <b><span class="text-muted black-40" id="clocase1" ></span></b>
            </div>
          </div>
        </div>
        <div class="fl w-50 tc stat-card">
          <div class="card-box tilebox-one">
            <span class="icon">
              <img src="assets/img/coronaactive.png">
            </span>
            <h6 class="black-40 ttu tl">Active Cases</h6>
            <h3 class="black tl" id="activeCases1" data-plugin="counterup"></h3>
            <div class="sub-info pt3 pb4">
              <span class="badge badge-danger mr-1" id="millisecond"></span>
              <span class="text-muted black-40">out of active cases:&nbsp;</span>
            <b><span class="text-muted black-40" id="activeCases3" ></span></b>
            </div>
          </div>
        </div>
      </article>
    

      <section class="country-table">
      <h1 class="mt0" style="font-family: Teko, sans-serif;font-size: 27px; color: #3696C4BF; ">	<span class="icon">
              <img src="assets/img/biology1.png" style="width:38px;">
            </span> COVID DATA</h1>
             <div class="table-responsive" style="height:800px;" >
             <table id="country-table" class="table table-striped table-curved">
                      <thead>
						<tr>
						<th width="5">Rank</th>
						<th width="80">Country</th>
						<th width="20">Total<br />Cases</th>
						<th width="30">New<br />Cases</th>
						<th width="30">Total<br />Deaths</th>
						<th width="30">New<br />Deaths</th>
						<th width="30">Total<br />Recovered</th>
						<th width="30">Active<br />Cases</th>
						<th width="30">Serious,<br />Critical</th>
						</tr>
						</thead>
                <tbody id="tbody"><tr>
                	<td></td>
                      <td></td>
                       <td></td>
                        <td></td>
                         <td></td>
                          <td></td>
                           <td></td>
                            <td></td>
                             <td></td>
                
                 </tr></tbody>
                 </table>        </div>
     
      </section>
           

	
        

</div>
  <footer class="">
			<div class="mt1">
			<p ><h6 class="black-40">
				
				<em > &copy; Copyright @2020. All rights reserved. Powered by Sharmi &amp; Rens</em>
				<br> <em >Sources: Worldometers</em>
				</h6></p>
				
			</div>
		</footer>

  <script>
      var t = $('#country-table').DataTable({
    	  "columnDefs": [
    	                 { "orderable": false, "targets": [1] },
    	                 {
    	                     "targets": [ 0 ],
    	                     "visible": false,
    	                     "searchable": false
    	                 }
    	               ],
      
        "order": [[ 2, 'desc' ]],
        "bLengthChange": false,
      });
      
  </script>
  <script>
    $(".theme-switch").on("click", () => { $("body").toggleClass("light-theme");});
    
  </script>
  
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
