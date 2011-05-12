
<jsp:include page="header.jsp"></jsp:include>

<%@ page errorPage="errorPage.jsp" %>

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
<jsp:setProperty name="DatabaseBean" property="URL" value="${dburl }" />

<p>DRV: <%= driver %></p>
<p>URL: <%= url %></p>
<p>USER: <%= username %></p>
<p>PASS: <%= password %></p>


		<div id="content">
			<div id="stylized" class="myform">
				<form id="form" name="form" method="post" action="query_database">
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

<jsp:include page="footer.jsp"></jsp:include>