
<jsp:include page="header.jsp"></jsp:include>

<%@ page errorPage="/errorPage.jsp" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.util.*" %>

<%! 	
	private String url;
	private String driver;
	private String username;
	private String password;

	public void jspInit(){
		ServletConfig config = getServletConfig();
		driver = config.getInitParameter("driver");
		url = config.getInitParameter("url");
		username = config.getInitParameter("username");
		password = config.getInitParameter("password");
		
	}
%>
<%
	if(request.getParameter("query") == null)
	{
%>
		<div id="content">
		
		<div id="stylized" class="myform">
			<form id="form" name="form" method="post" action="Lab04.jsp">
				<p>Input a correct SQL statement below to query the database.<br />
				Query results will be show on the following page after submission.</p>
				
				<h3>Sample Query:</h3>
				<p>SELECT * FROM beatles<br />
				SELECT * FROM beatles WHERE title LIKE '%Help%'</p>
				
				<h3>Please input your query:</h3><br />
				<input SIZE="50" name="query" id="query" />
				
				<button type="submit">Submit</button>
				<div class="spacer"></div>
			</form>
		</div>

<%		
	} else {
		%>
			<jsp:useBean id="DatabaseBean" class="a00222500.lab04.DatabaseBean" scope="session" />
			<jsp:setProperty name="DatabaseBean" property="URL" value="<%= url %>" />
			<jsp:setProperty name="DatabaseBean" property="driver" value="<%= driver %>" />
			<jsp:setProperty name="DatabaseBean" property="username" value="<%= username %>" />
			<jsp:setProperty name="DatabaseBean" property="password" value="<%= password %>" />
		
			<div id="tablecontent">
			<h2 class="link"><a href="Lab04.jsp"><%= pageContext.getServletConfig().getInitParameter("linkText") %></a></h2>
		<%
		
		//form submitted
		String query = request.getParameter("query");
		
		//connect to database
		DatabaseBean.connect();
		
		//submit query to database
		DatabaseBean.setQueryString(query);
		Vector tableData = DatabaseBean.runQuery();
		Iterator rows = tableData.iterator();
		
		%> <table> <%
		
		//display headers
		Vector headerNames = DatabaseBean.generateMetaData();
		Iterator headers = headerNames.iterator();
		while (headers.hasNext()) {
			String field = (String)headers.next();
			%> <th><%= field %></th> <%
		}
		
		//display columns
		int count = 0;
		while (rows.hasNext()) {
			if (count % 2 == 0) {
				%> <TR bgcolor="#C3F3C3"> <%
			} else {
				%> <TR bgcolor="#FFFFFF"> <%
			}
			Vector singleRow = (Vector)rows.next();
			Iterator fields = singleRow.iterator();
			while (fields.hasNext()) {
				String field = (String)fields.next();
				%> <td><%= field %></td> <%
			}
			%> </tr> <%
			count++;
		}
		
		DatabaseBean.cleanUp();
		
		%> </table> <%
	}
%>
	</div> <!-- end content div -->

<jsp:include page="footer.jsp"></jsp:include>





