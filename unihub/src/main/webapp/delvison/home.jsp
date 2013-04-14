<!DOCTYPE html>
<!--This shall be our main home screen -->
<%@ page import="com.unihub.app.HtmlOutputUtilities, com.unihub.app.Event, 
        com.unihub.app.EventListHolder" %>
<%@ include file="/delvison/header.jsp" %>
<%
  /*
  This will temporarily be here since I will get this info from
  the database when its set up*/
  String[] cats = {"Appliances",
    "Art Supplies",
    "Bikes",
    "Books",
    "Cars" ,
    "Cell Phones",
    "Clothes",
    "Computers",
    "Electronics",
    "Freebies",
    "Furniture",
    "Games",
    "Jobs",
    "Music",
    "Musical Instruments",
    "Movies",
    "Pets",
    "Sporting Goods",
    "Wanted",
    "Everything Else.."};

  EventListHolder holder = EventListHolder.getInstance();
  String user = (String)session.getAttribute("username");
%>

  <body>
    <div class="container-fluid" data-spy="scroll" data-target="#events">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Categories</li>
              <% for (int i=0; i < cats.length; i++){ %>
                  <li>
                    <a href="viewalllistings?cat=<%=cats[i]%>"><%=cats[i]%></a>
                  </li>
              <%}%>
            </ul>
          </div><!--/.well -->
          <br>

          <!--Events-->
          <div id="events" class="well nav sidebar-nav affix-top">
            <h2>Events</h2>
              <table class="table">
          <% for(int i = 0; i < holder.numOfEvents(); i++){ %>

            <tr>
              <td>
                <h3><%= holder.getEvent(i).getTitle() %></h3>
                <p>on <%= holder.getEvent(i).getThingy() %></p>
                <p><%= holder.getEvent(i).getDes() %></p>
                <p><%= holder.getEvent(i).howManyGoing() %></p>
                <a href="attend?id=<%=holder.getEvent(i).getId() %> ">Attending</a> | <a href="#">More Info</a>
              </td>
            </tr>

          <% } %>
          <!--This bottom part is only for linking to viewing all events -->
          <tr>
            <td>
              <h4><a href="events">View All</a></h3>
            </td>
          </tr> 

        </table>
      </div>

        </div><!--/span-->
        <div class="span9 jetstrap-highlighted">
      <div id="myCarousel" class="carousel slide" data-pause="remove">
      <div class="carousel-inner">
        <div class="item active">
          <img class="" src="design/images/books.jpg">
          <div class="container jetstrap-highlighted">
            <div class="carousel-caption">
              <h1><p style="color:white">Welcome to UniHub!</p></h1>
              <p class="lead"> UniHub is an online classified listing service specifically geared towards the college ecosystem. On UniHub, you are able to sell and buy things from fellow members of your university. The stuff you need quick and easy. So go ahead and give it a try!</p>
              <a class="btn btn-large btn-primary" href="signup">Sign up today</a>
            </div>
          </div>
        </div><br>
      
      <!--Personalized to location-->
      <div class="shadow">
        <div class="container-fluid">
            <ul class="inline">
              <li><h3> <%=sc%>, <%=st%></h3></li>
              <li><a href="populateUniversities">Change Location</a></li>
            </ul>
          <div class="row-fluid">
            <div class="span5">
              <h3>Weather</h3>
              <p>
                Query some service for local weather maybe. just a thought.
              </p>
            </div>
            <div class="span1" style="width:1px;height:160px;background-color:gray;float:left;"></div> 
            <div class="span6">
              <h3>Reccommended Spots</h3>
              <p>
                Show stuff specific to location here. 
                Cool idea: query google to find populated public places in the area so that we can recommend these as a meeting spot for exchanges.
              </p>
            </div>
          </div>
        </div>
      </div>
      <br>

      <!--Recent listings Carousel-->
      <div class="shadow" style="height:450px">
        <div class="container-fluid">
          <h3>Recently Posted</h3>
          <div id="listingsCarousel" class="carousel slide">
            <div class="carousel-inner">
              <div class="item active">
                <%@ include file="/delvison/singleListingInclude.jsp" %>
              </div>
              <div class="item">
                <%@ include file="/delvison/singleListingInclude.jsp" %>
              </div>
            </div>
            <a class="carousel-control left" href="#listingsCarousel" data-slide="prev"></a>
            <a class="carousel-control right" href="#listingsCarousel" data-slide="next"></a>
          </div>
        </div>
      </div>

      <br>
      <!--My listings-->
      <% if (user != null){ %>
      <div class="shadow">
        <div class="container-fluid">
          <h3>My Listings</h3>
          <table class="table table-striped">
              <devjsp:forEachListing user="<%=user%>">
              <tr>
                <td valign="center">
                  <ul class="inline">
                    <li><p>
                    <a href="item?id=${listingId}">
                       ${listingName} - $${listingPrice} </a>
                    ${listingUniversity}, ${listingLocation}
                  </p></li>
                  <li class="pull-right">${listingDate}</li>
                </ul>
                </td>
              </tr>
              </devjsp:forEachListing>
            </table>
        </div>
      </div>
      <%}%>  

      <hr>
      <footer>
        <p>&copy; UniHub</p>
      </footer>
    </div><!--/.fluid-container-->



    <style>
      
      body {
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
      
      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
      
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
    </script>
    <script src="assets/js/bootstrap.js">
    </script>
    <script>

    </script>
  </body>
</html>