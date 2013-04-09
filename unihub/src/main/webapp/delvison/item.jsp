<!--jsp for individual items-->
    <script type="text/javascript" src="design/bootstrap/js/lightbox.js"></script>
    <link rel="stylesheet" type="text/css" href="design/bootstrap/css/lightbox.css" ></link>
    <%@ page import="com.unihub.app.ListingsObj, com.unihub.app.CommentObj,
    com.unihub.app.Comment, com.unihub.app.Stuff, java.util.*, javax.ejb.EJB,
    com.unihub.app.ListingObjEJB, javax.naming.*, com.unihub.app.ListingObjEJB" %>
              
    <%@ taglib uri="/WEB-INF/tlds/devjsp-taglib.tld" prefix="devjsp" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@include file="header.jsp" %>
    <%@ page isELIgnored="false" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    
    <%!@EJB ListingObjEJB lis; %>
    <% 
    String user = (String)session.getAttribute("username");
    String id = (String)request.getParameter("id");
    Context context = new InitialContext();
    lis = (ListingObjEJB) context.lookup("ejb:unihub-ear/unihub-ejb//ListingObjEJB!com.unihub.app.ListingObjEJB?stateful");
    %>   

<body>
  <div id='content' class='row-fluid'>
      
      <!--ITEM INFO PANE -->
      <div class='span8 main' style="background-color:White">
              <devjsp:itemInfo itemId="<%=id%>">
                <center><p>
                  <h2>${itemName} - $${itemPrice} (${itemUniversity},
                   ${itemLocation})</h2>
                </p>
                </center>
              </devjsp:itemInfo>
     <!--         devjsp:upvote itemId="<%=id%>" user="<%=user%>"  -->
              <devjsp:belongsToUser itemId="<%=id%>" user="<%=user%>" />
              <devjsp:itemInfo itemId="<%=id%>">
                <br>
                <i>Category:</i> ${itemCategory}<br>
                <i>Posted ${itemTime} by</i> <a href="profile">${itemUser}</a>
              </devjsp:itemInfo >
              
              <div class="accordion" id="accordion2">
                <div class="accordion-group">
                  <div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" 
                       data-parent="#accordion2" href="#collapseOne">
                         Images
                    </a>
                  </div>
                  <div id="collapseOne" class="accordion-body collapse">
                    <div class="accordion-inner">
                      <!-- PLACE IMAGE THuMBNAILS IN HERE -->
                      <div class="row-fluid">
                          <ul class="thumbnails container-fluid">
                            <devjsp:pic itemId="<%=id%>">
                              <li class="span3">
                                  <a href="${imagePath}" rel="lightbox" class="thumbnail">
                                    <img src="${imagePath}"  rel="lightbox">
                                  </a>
                              </li>
                            </devjsp:pic >
                          </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="accordion" id="accordion3">
                <div class="accordion-group">
                  <div class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse"
                       data-parent="#accordion3" href="#collapseTwo">
                       Description
                    </a>
                  </div>
                  <div id="collapseTwo" class="accordion-body collapse in">
                    <div class="accordion-inner">
                      <devjsp:itemInfo itemId="<%=id%>">
                        <p>${itemDescription}</p>
                      </devjsp:itemInfo >
                    </div>
                  </div>
                </div>
              </div> 
        </div>
      
        <!--SIDEBAR-->
        <% String bidMode = lis.getBidMode(Integer.parseInt(id));
           if (bidMode.equals("yes")){ %>  
           <%@include file="commentWithBidInclude.jsp" %>
           <% }else{ %>
           <%@include file="commentNoBidInclude.jsp" %>
           <%}%>
  </div>
  </div>
</body>
</html>