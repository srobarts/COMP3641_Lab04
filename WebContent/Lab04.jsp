
<jsp:include page="header.jsp"></jsp:include>

<%@ page errorPage="errorPage.jsp" %>
<%@ page language="java" import="java.sql.*" %>

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

<jsp:useBean id="DatabaseBean" class="businesslogic_lab04.DatabaseBean" />
<jsp:setProperty name="DatabaseBean" property="URL" value="<%= url %>" />
<jsp:setProperty name="DatabaseBean" property="driver" value="<%= driver %>" />
<jsp:setProperty name="DatabaseBean" property="username" value="<%= username %>" />
<jsp:setProperty name="DatabaseBean" property="password" value="<%= password %>" />

<p>URL: <jsp:getProperty name="DatabaseBean" property="URL" /></p>
<p>Driver: <jsp:getProperty name="DatabaseBean" property="driver" /></p>
<p>User: <jsp:getProperty name="DatabaseBean" property="username" /></p>
<p>Pass: <jsp:getProperty name="DatabaseBean" property="password" /></p><br />

<% DatabaseBean.connect(); %>

<%
	if(request.getParameter("form") != null){
		//form submitted
		String query = request.getParameter("query");
		DatabaseBean.setQueryString(query);
		DatabaseBean.runQuery();
		//Vector resultVector = DatabaseBean.getResultSet();
		//sqlResult = ServletUtilities.getHTMLTable(resultVector);
	}
%>

		<div id="content">
			<div id="stylized" class="myform">
				<form id="form" name="form" method="post" action="Lab04.jsp">
					<p>Input a correct SQL statement below to query the database.<br />
					Query results will be show on the following page after submission.</p>
					
					<h3>Sample Query:</h3>
					<p>SELECT * FROM beatles<br />
					SELECT * FROM beatles WHERE title LIKE '%Help%'</p>
					
					<label>Query:
					<span class="small">Please input your query:</span><br />
					</label>
					<input SIZE="50" name="query" id="query" />
					
					<button type="submit">Submit</button>
					<div class="spacer"></div>
				</form>
			</div>
		</div>
		
		<div id="tablecontent">
			${sqlResult }
		</div>

<jsp:include page="footer.jsp"></jsp:include>